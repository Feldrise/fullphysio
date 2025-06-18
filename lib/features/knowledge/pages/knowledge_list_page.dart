import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/video_provider.dart';
import '../widgets/video_list_item.dart';

class KnowledgeListPage extends ConsumerWidget {
  final String category;
  const KnowledgeListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videosAsync = ref.watch(videoProvider(category));
    final theme = Theme.of(context);

    return Column(
      children: [
        // Category description banner
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: theme.colorScheme.primaryContainer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$category Library', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(getCategoryDescription(category), style: theme.textTheme.bodyMedium),
            ],
          ),
        ),

        // Video list
        Expanded(
          child: videosAsync.when(
            data:
                (videos) =>
                    videos.isEmpty
                        ? const Center(child: Text('No videos available'))
                        : ListView.builder(padding: const EdgeInsets.only(top: 8), itemCount: videos.length, itemBuilder: (context, i) => VideoListItem(video: videos[i])),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),
        ),
      ],
    );
  }

  String getCategoryDescription(String category) {
    switch (category) {
      case 'Modules':
        return 'Comprehensive training modules for physiotherapists at all levels';
      case 'Masterclass':
        return 'Expert-led advanced technique demonstrations and lectures';
      case 'Webinars':
        return 'Recorded webinar sessions on current topics in physiotherapy';
      case 'Clinical Practices':
        return 'Videos demonstrating proper clinical practice techniques';
      case 'Clinical Tests':
        return 'Detailed demonstrations of assessment tests and procedures';
      default:
        return 'Video content for physiotherapists';
    }
  }
}
