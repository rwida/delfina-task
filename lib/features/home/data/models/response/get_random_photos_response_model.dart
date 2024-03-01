import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/api_response.dart';
import 'photos_url_response_model.dart';

part 'get_random_photoos_response_model.g.dart';

@JsonSerializable()
class GetRandomPhotosResponseModel extends BaseResponse<GetRandomPhotosResponseModel> {
  GetRandomPhotosResponseModel({
    this.id,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.color,
    this.urls,
  });

  final String? id;
  final String? slug;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final String? color;
  final PhotosUrlResponseModel? urls;

  factory GetRandomPhotosResponseModel.fromJson(Map<String, dynamic> json) => _$GetRandomPhotosResponseModelFromJson(json);

  @override
  GetRandomPhotosResponseModel fromJson(Map<String, dynamic> json) => GetRandomPhotosResponseModel.fromJson(json);

  @override
  List<Object> get props => <Object>[id ?? ''];

  Map<String, dynamic> toJson() => _$GetRandomPhotosResponseModelToJson(this);
}
