import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/api_response.dart';

part 'photos_url_response_model.g.dart';

@JsonSerializable()
class PhotosUrlResponseModel extends BaseResponse<PhotosUrlResponseModel> {
  PhotosUrlResponseModel({
    this.full,
  });

  final String? full;

  factory PhotosUrlResponseModel.fromJson(Map<String, dynamic> json) => _$PhotosUrlResponseModelFromJson(json);

  @override
  PhotosUrlResponseModel fromJson(Map<String, dynamic> json) => PhotosUrlResponseModel.fromJson(json);

  @override
  List<Object> get props => <Object>[full ?? ''];

  Map<String, dynamic> toJson() => _$PhotosUrlResponseModelToJson(this);
}
