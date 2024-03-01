import 'package:injectable/injectable.dart';

import '../../../../core/common/usecase.dart';
import '../../data/models/request/get_random_photos_request_model.dart';
import '../../data/models/response/get_random_photos_response_model.dart';
import '../repository/get_random_photos_repository.dart';

@Injectable()
class GetRandomPhotosUseCase extends UseCase<Future<GetRandomPhotosResponseModel>, GetRandomPhotosRequestModel> {
  GetRandomPhotosUseCase(this._getRandomPhotosRepository);

  final GetRandomPhotosRepository _getRandomPhotosRepository;

  @override
  Future<GetRandomPhotosResponseModel> call({required GetRandomPhotosRequestModel params}) async {
    return _getRandomPhotosRepository.getRandomPhotos(getRandomPhotoesRequestModel: params);
  }
}
