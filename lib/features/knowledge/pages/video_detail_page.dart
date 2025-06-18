import 'package:flutter/material.dart';
import 'package:fullphysio/features/navigation/scaffold_with_drawer.dart';
import '../models/video_content.dart';

class VideoDetailPage extends StatelessWidget {
  final VideoContent video;

  const VideoDetailPage({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithDrawer(
      title: video.title,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video placeholder
            Container(
              height: 220,
              width: double.infinity,
              color: Colors.grey.shade800,
              child: Center(child: Icon(Icons.play_circle_fill, size: 80, color: Theme.of(context).colorScheme.primary)),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and duration
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(video.title, style: Theme.of(context).textTheme.headlineSmall)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer, borderRadius: BorderRadius.circular(16)),
                        child: Row(children: [const Icon(Icons.timer, size: 16), const SizedBox(width: 4), Text(video.duration)]),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Category badge
                  Chip(label: Text(video.category), backgroundColor: Theme.of(context).colorScheme.secondaryContainer),

                  const SizedBox(height: 16),

                  // Description
                  Text('Description', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(video.description, style: Theme.of(context).textTheme.bodyLarge),

                  const SizedBox(height: 24),

                  // Mock related content
                  Text('Related Content', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),

                  // Mock related videos list
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceVariant, borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade700,
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                ),
                                child: const Center(child: Icon(Icons.play_arrow, size: 40, color: Colors.white)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Related video ${index + 1}', style: Theme.of(context).textTheme.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
