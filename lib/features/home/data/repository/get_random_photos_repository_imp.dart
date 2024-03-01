import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/index.dart';
import '../../domain/repository/get_random_photos_repository.dart';
import '../models/request/get_random_photos_request_model.dart';
import '../models/response/get_random_photos_response_model.dart';

@Injectable(as: GetRandomPhotosRepository)
class GetRandomPhotosRepositoryImp implements GetRandomPhotosRepository {
  GetRandomPhotosRepositoryImp(this._apiService);

  final ApiService _apiService;

  @override
  Future<GetRandomPhotosResponseModel> getRandomPhotos({required GetRandomPhotosRequestModel getRandomPhotoesRequestModel}) async {
    final Response<dynamic> response = await _apiService.getApi(
      AppApiPaths.getRandomPhotos,
      body: getRandomPhotoesRequestModel.toJson(),
    );
    return GetRandomPhotosResponseModel.fromJson(response.data as Map<String, dynamic>);
  }
}
