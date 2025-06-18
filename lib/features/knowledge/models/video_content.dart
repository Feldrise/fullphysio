import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_content.freezed.dart';
part 'video_content.g.dart';

@freezed
abstract class VideoContent with _$VideoContent {
  const factory VideoContent({
    required String id,
    required String title,
    required String description,
    required String duration,
    required String category, // e.g. Modules, Masterclass, etc.
    String? thumbnailUrl,
    String? videoUrl,
  }) = _VideoContent;

  factory VideoContent.fromJson(Map<String, dynamic> json) => _$VideoContentFromJson(json);
}
