// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_random_photos_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRandomPhotosResponseModel _$GetRandomPhotosResponseModelFromJson(Map<String, dynamic> json) => GetRandomPhotosResponseModel(
      id: json['id'] as String?,
      slug: json['slug'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      color: json['color'] as String?,
      urls: json['urls'] == null ? null : PhotosUrlResponseModel.fromJson(json['urls'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetRandomPhotosResponseModelToJson(GetRandomPhotosResponseModel instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'color': instance.color,
      'urls': instance.urls,
    };
