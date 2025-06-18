import 'package:flutter/material.dart';
import '../pages/knowledge_list_page.dart';

class KnowledgeDrawer extends StatelessWidget {
  const KnowledgeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Knowledge')),
          ListTile(title: const Text('Modules'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const KnowledgeListPage(category: 'Modules')))),
          ListTile(title: const Text('Masterclass'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const KnowledgeListPage(category: 'Masterclass')))),
          ListTile(title: const Text('Webinars'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const KnowledgeListPage(category: 'Webinars')))),
          ListTile(
            title: const Text('Clinical Practices'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const KnowledgeListPage(category: 'Clinical Practices'))),
          ),
          ListTile(
            title: const Text('Clinical Tests'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const KnowledgeListPage(category: 'Clinical Tests'))),
          ),
        ],
      ),
    );
  }
}
