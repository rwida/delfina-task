import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/app_logger.dart';
import '../../data/models/response/get_random_photos_response_model.dart';
import '../../domain/use_cases/get_random_photos_use_case.dart';
import 'get_random_photos_event.dart';
import 'get_random_photos_state.dart';

@Injectable()
class GetRandomPhotosBloc extends Bloc<GetRandomPhotosEvent, GetRandomPhotosState> {
  GetRandomPhotosBloc(
    this._getRandomPhotosUseCase,
    this._logger,
  ) : super(GetRandomPhotosStateUninitialized()) {
    on<GetRandomPhotosEventFetchEvent>(_getRandomPhotos);
    on<GetRandomPhotosRewindEvent>(_getRewindPhotos);
  }

  final GetRandomPhotosUseCase _getRandomPhotosUseCase;
  final AppLogger _logger;

  Future<void> _getRandomPhotos(GetRandomPhotosEventFetchEvent event, Emitter<GetRandomPhotosState> emit) async {
    try {
      _logger.debug('_getRandomPhotos Loading');
      emit(GetRandomPhotosStateStateLoading());
      final GetRandomPhotosResponseModel getRandomPhotosRequestModel = await _getRandomPhotosUseCase(params: event.getRandomPhotosRequestModel);
      _logger.debug('_getRandomPhotos Success');
      emit(GetRandomPhotosStateSuccess(getRandomPhotosResponseModel: getRandomPhotosRequestModel));
    } catch (e, trace) {
      _logger.error('_getRandomPhotos Error: $e', trace);
      emit(GetRandomPhotosStateFailed(error: e.toString()));
    }
  }

  Future<void> _getRewindPhotos(GetRandomPhotosRewindEvent event, Emitter<GetRandomPhotosState> emit) async {
    try {
      List<String> urlImages = [];

      _logger.debug('_getRewindPhotos Loading');
      emit(GetRandomPhotosStateStateLoading());

      for (int i = 0; i < 5; i++) {
        // Call the use case to get random photos
        final GetRandomPhotosResponseModel getRandomPhotosRequestModel = await _getRandomPhotosUseCase(params: event.getRandomPhotosRequestModel);

        // Assuming the response model contains a list of URLs
        urlImages.add(getRandomPhotosRequestModel.urls?.full ?? '');

        _logger.debug('_getRewindPhotos Iteration $i Success');
      }

      _logger.debug('_getRewindPhotos All iterations completed ${urlImages.asMap()}');
      emit(GetRandomPhotosRewindStateSuccess(urlImages: urlImages));
    } catch (e, trace) {
      _logger.error('_getRewindPhotos Error: $e', trace);
      emit(GetRandomPhotosStateFailed(error: e.toString()));
    }
  }
}
