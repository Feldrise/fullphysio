import 'package:flutter/material.dart';
import '../models/video_content.dart';
import '../pages/video_detail_page.dart';

class VideoListItem extends StatelessWidget {
  final VideoContent video;
  const VideoListItem({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: video.thumbnailUrl != null ? Image.network(video.thumbnailUrl!, width: 56, height: 56, fit: BoxFit.cover) : const Icon(Icons.ondemand_video, size: 40),
        title: Text(video.title),
        subtitle: Text(video.description),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(video.duration, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => VideoDetailPage(video: video)));
              },
              child: const Text('View'),
            ),
          ],
        ),
      ),
    );
  }
}
