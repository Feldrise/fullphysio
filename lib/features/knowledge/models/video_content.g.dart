// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VideoContent _$VideoContentFromJson(Map<String, dynamic> json) =>
    _VideoContent(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      duration: json['duration'] as String,
      category: json['category'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      videoUrl: json['videoUrl'] as String?,
    );

Map<String, dynamic> _$VideoContentToJson(_VideoContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'duration': instance.duration,
      'category': instance.category,
      'thumbnailUrl': instance.thumbnailUrl,
      'videoUrl': instance.videoUrl,
    };
