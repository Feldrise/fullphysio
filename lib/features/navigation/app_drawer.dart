import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final void Function(String route) onSelect;
  final bool isPermanent;
  const AppDrawer({super.key, required this.onSelect, this.isPermanent = false});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final items = [
      _DrawerSection(
        title: 'Knowledge',
        color: colorScheme.primary,
        items: [
          _DrawerItem('Modules', '/knowledge/modules', Icons.menu_book),
          _DrawerItem('Masterclass', '/knowledge/masterclass', Icons.school),
          _DrawerItem('Webinars', '/knowledge/webinars', Icons.video_call),
          _DrawerItem('Clinical Practices', '/knowledge/clinical-practices', Icons.local_hospital),
          _DrawerItem('Clinical Tests', '/knowledge/clinical-tests', Icons.science),
        ],
      ),
      _DrawerSection(
        title: 'Care',
        color: colorScheme.secondary,
        items: [
          _DrawerItem('My Patients', '/care/patients', Icons.people),
          _DrawerItem('Exercises', '/care/exercises', Icons.fitness_center),
          _DrawerItem('Program Templates', '/care/program-templates', Icons.assignment),
          _DrawerItem('Clinical Tools', '/care/clinical-tools', Icons.medical_services),
          _DrawerItem('Protocols', '/care/protocols', Icons.description),
        ],
      ),
      _DrawerSection(title: 'Academy', color: colorScheme.tertiary, items: [_DrawerItem('My Trainings', '/academy/trainings', Icons.playlist_play)]),
    ];

    final drawerContent = ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: colorScheme.primary,
            gradient: LinearGradient(colors: [colorScheme.primary, colorScheme.primaryContainer], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Align(alignment: Alignment.bottomLeft, child: Text('Fullphysio', style: textTheme.headlineMedium?.copyWith(color: colorScheme.onPrimary))),
        ),
        for (final section in items) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(section.title, style: textTheme.titleMedium?.copyWith(color: section.color, fontWeight: FontWeight.bold)),
          ),
          ...section.items.map(
            (item) => ListTile(
              leading: Icon(item.icon, color: colorScheme.primary),
              title: Text(item.label),
              onTap: () => onSelect(item.route),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              hoverColor: colorScheme.primary.withOpacity(0.08),
            ),
          ),
        ],
      ],
    );

    if (isPermanent) {
      return Drawer(elevation: 0, child: drawerContent);
    }
    return Drawer(child: drawerContent);
  }
}

class _DrawerSection {
  final String title;
  final Color color;
  final List<_DrawerItem> items;
  _DrawerSection({required this.title, required this.color, required this.items});
}

class _DrawerItem {
  final String label;
  final String route;
  final IconData icon;
  _DrawerItem(this.label, this.route, this.icon);
}
