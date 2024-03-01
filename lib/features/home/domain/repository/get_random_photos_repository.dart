import '../../data/models/request/get_random_photos_request_model.dart';
import '../../data/models/response/get_random_photos_response_model.dart';

abstract class GetRandomPhotosRepository {
  Future<GetRandomPhotosResponseModel> getRandomPhotos({required GetRandomPhotosRequestModel getRandomPhotoesRequestModel});
}
