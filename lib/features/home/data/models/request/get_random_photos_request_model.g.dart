// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_random_photos_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRandomPhotosRequestModel _$GetRandomPhotosRequestModelFromJson(
        Map<String, dynamic> json) =>
    GetRandomPhotosRequestModel(
      clientID: json['client_id'] as String,
      query: json['query'] as String,
    );

Map<String, dynamic> _$GetRandomPhotosRequestModelToJson(
        GetRandomPhotosRequestModel instance) =>
    <String, dynamic>{
      'client_id': instance.clientID,
      'query': instance.query,
    };
