import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/video_content.dart';

final videoProvider = FutureProvider.family<List<VideoContent>, String>((ref, category) async {
  // Simulate loading
  await Future.delayed(const Duration(milliseconds: 500));

  // Generate more detailed mock data by category
  List<VideoContent> videos = [];

  // Common videos for all categories (adjust based on the category)
  videos.add(
    VideoContent(
      id: '1',
      title: 'Introduction to $category',
      description: 'A basic overview of $category for physiotherapists.',
      duration: '12:34',
      category: category,
      thumbnailUrl: null,
      videoUrl: null,
    ),
  );

  // Category-specific videos
  switch (category) {
    case 'Modules':
      videos.addAll([
        VideoContent(
          id: '2',
          title: 'Musculoskeletal Assessments',
          description: 'Learn how to perform comprehensive musculoskeletal assessments.',
          duration: '25:10',
          category: category,
          thumbnailUrl: null,
          videoUrl: null,
        ),
        VideoContent(
          id: '3',
          title: 'Low Back Pain Management',
          description: 'Evidence-based approaches to managing low back pain.',
          duration: '18:42',
          category: category,
          thumbnailUrl: null,
          videoUrl: null,
        ),
      ]);
      break;

    case 'Masterclass':
      videos.addAll([
        VideoContent(
          id: '2',
          title: 'Advanced Manual Therapy Techniques',
          description: 'Master advanced manual therapy techniques with Dr. Smith.',
          duration: '45:22',
          category: category,
          thumbnailUrl: null,
          videoUrl: null,
        ),
        VideoContent(
          id: '3',
          title: 'Sports Rehabilitation Masterclass',
          description: 'Learn from elite sports therapists about rehabilitation protocols.',
          duration: '52:15',
          category: category,
          thumbnailUrl: null,
          videoUrl: null,
        ),
      ]);
      break;

    case 'Webinars':
      videos.addAll([
        VideoContent(
          id: '2',
          title: 'Latest Research in Physiotherapy',
          description: 'A webinar discussing recent research developments in physiotherapy.',
          duration: '62:45',
          category: category,
          thumbnailUrl: null,
          videoUrl: null,
        ),
        VideoContent(
          id: '3',
          title: 'Integrating Technology in Practice',
          description: 'How to effectively use technology in your physiotherapy practice.',
          duration: '48:30',
          category: category,
          thumbnailUrl: null,
          videoUrl: null,
        ),
      ]);
      break;

    case 'Clinical Practices':
      videos.addAll([
        VideoContent(
          id: '2',
          title: 'Vestibular Rehabilitation',
          description: 'Clinical practice guidelines for vestibular rehabilitation.',
          duration: '35:18',
          category: category,
          thumbnailUrl: null,
          videoUrl: null,
        ),
        VideoContent(
          id: '3',
          title: 'Neurological Assessment Protocols',
          description: 'Step-by-step neurological assessment protocols for physiotherapists.',
          duration: '28:52',
          category: category,
          thumbnailUrl: null,
          videoUrl: null,
        ),
      ]);
      break;

    case 'Clinical Tests':
      videos.addAll([
        VideoContent(
          id: '2',
          title: 'Shoulder Special Tests',
          description: 'A comprehensive guide to shoulder special tests and their interpretation.',
          duration: '22:40',
          category: category,
          thumbnailUrl: null,
          videoUrl: null,
        ),
        VideoContent(
          id: '3',
          title: 'Knee Assessment Tests',
          description: 'Detailed demonstration of knee assessment tests with clinical reasoning.',
          duration: '19:27',
          category: category,
          thumbnailUrl: null,
          videoUrl: null,
        ),
      ]);
      break;

    default:
      videos.add(
        VideoContent(
          id: '2',
          title: '$category Advanced Content',
          description: 'Deep dive into advanced $category topics.',
          duration: '25:10',
          category: category,
          thumbnailUrl: null,
          videoUrl: null,
        ),
      );
  }

  return videos;
});
