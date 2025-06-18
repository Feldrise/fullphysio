import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String route;
  final Color? color;

  const CategoryCard({super.key, required this.title, required this.subtitle, required this.icon, required this.route, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardColor = color ?? theme.colorScheme.primaryContainer;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => context.go(route),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(color: cardColor.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                child: Icon(icon, color: cardColor, size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(subtitle, style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: theme.colorScheme.primary, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
