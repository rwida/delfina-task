import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/api_response.dart';

part 'get_random_photos_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class GetRandomPhotosRequestModel extends BaseResponse<dynamic> {
  GetRandomPhotosRequestModel({
    required this.clientID,
    required this.query,
  });

  @JsonKey(name: 'client_id')
  final String clientID;
  final String query;

  factory GetRandomPhotosRequestModel.fromJson(Map<String, dynamic> json) => _$GetRandomPhotosRequestModelFromJson(json);

  @override
  GetRandomPhotosRequestModel fromJson(Map<String, dynamic> json) => GetRandomPhotosRequestModel.fromJson(json);

  @override
  List<Object?> get props => <Object?>[];

  Map<String, dynamic> toJson() => _$GetRandomPhotosRequestModelToJson(this);
}
