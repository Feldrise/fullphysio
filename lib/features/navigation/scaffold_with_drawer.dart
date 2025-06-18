import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_drawer.dart';

/// A scaffold that includes the app drawer, to be used across the entire app
/// for consistent navigation.
class ScaffoldWithDrawer extends StatelessWidget {
  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final bool? automaticallyImplyLeading;
  final Widget? floatingActionButton;

  const ScaffoldWithDrawer({super.key, required this.child, this.title, this.actions, this.automaticallyImplyLeading, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      appBar: AppBar(title: title != null ? Text(title!) : null, actions: actions, automaticallyImplyLeading: automaticallyImplyLeading ?? true),
      drawer:
          isDesktop
              ? null
              : AppDrawer(
                onSelect: (route) {
                  context.go(route);
                  Navigator.pop(context); // Close drawer
                },
              ),
      floatingActionButton: floatingActionButton,
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
          Expanded(child: child),
        ],
      ),
    );
  }
}
