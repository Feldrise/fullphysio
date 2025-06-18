import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/category_card.dart';

class KnowledgeHomePage extends StatelessWidget {
  const KnowledgeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner
          Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [theme.colorScheme.primary, theme.colorScheme.primaryContainer], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Physiotherapy Knowledge Hub', style: theme.textTheme.headlineSmall?.copyWith(color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Access videos, courses, and clinical resources', style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onPrimary.withOpacity(0.8))),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Text('Categories', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold))),

          const SizedBox(height: 8),

          // Categories
          CategoryCard(
            title: 'Modules',
            subtitle: 'Video training modules for physiotherapists',
            icon: Icons.menu_book,
            route: '/knowledge/modules',
            color: theme.colorScheme.primary,
          ),
          CategoryCard(title: 'Masterclass', subtitle: 'Expert-led masterclass videos', icon: Icons.school, route: '/knowledge/masterclass', color: theme.colorScheme.secondary),
          CategoryCard(title: 'Webinars', subtitle: 'Recorded webinar sessions', icon: Icons.video_call, route: '/knowledge/webinars', color: theme.colorScheme.tertiary),
          CategoryCard(
            title: 'Clinical Practices',
            subtitle: 'Videos demonstrating clinical practices',
            icon: Icons.local_hospital,
            route: '/knowledge/clinical-practices',
            color: Colors.teal,
          ),
          CategoryCard(
            title: 'Clinical Tests',
            subtitle: 'Videos showing clinical test procedures',
            icon: Icons.science,
            route: '/knowledge/clinical-tests',
            color: Colors.deepPurple,
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
