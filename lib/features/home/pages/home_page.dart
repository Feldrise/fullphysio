import 'package:flutter/material.dart';
import 'package:fullphysio/features/navigation/app_drawer.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  final String? userEmail;
  const HomePage({super.key, this.userEmail});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;
    return Scaffold(
      appBar: AppBar(title: const Text('Fullphysio Home')),
      drawer:
          isDesktop
              ? null
              : AppDrawer(
                onSelect: (route) {
                  context.go(route);
                  Navigator.pop(context);
                },
              ),
      body: Row(
        children: [
          if (isDesktop)
            SizedBox(
              width: 280,
              child: AppDrawer(
                onSelect: (route) {
                  context.go(route);
                },
                isPermanent: true,
              ),
            ),
          Expanded(child: Center(child: Text('Welcome${userEmail != null ? ", $userEmail" : ""}!'))),
        ],
      ),
    );
  }
}
