import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/providers/auth_provider.dart';
import '../auth/pages/login_page.dart';
import '../knowledge/pages/knowledge_home_page.dart';
import '../knowledge/pages/knowledge_list_page.dart';
import 'scaffold_with_drawer.dart';

// Define all routes for the application
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    // Redirect to login if not authenticated
    redirect: (context, state) {
      final loggedIn = authState.value != null;
      final isLoggingIn = state.fullPath == '/login';

      if (!loggedIn && !isLoggingIn) {
        return '/login';
      }

      if (loggedIn && isLoggingIn) {
        return '/';
      }

      return null;
    },

    // Error page
    errorBuilder: (context, state) => Scaffold(body: Center(child: Text('Error: ${state.error}'))), // Define routes
    routes: [
      // Login route
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),

      // Home route
      GoRoute(
        path: '/',
        builder:
            (context, state) =>
                ScaffoldWithDrawer(title: 'Fullphysio Home', child: Center(child: Text('Welcome${authState.value?.email != null ? ", ${authState.value?.email}" : ""}!'))),
      ),

      // Knowledge routes
      GoRoute(
        path: '/knowledge',
        builder:
            (context, state) => ScaffoldWithDrawer(
              title: 'Knowledge',
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Search not implemented yet')));
                  },
                ),
              ],
              child: const KnowledgeHomePage(),
            ),
      ),

      // Knowledge subpages
      GoRoute(
        path: '/knowledge/modules',
        builder:
            (context, state) => ScaffoldWithDrawer(
              title: 'Modules',
              actions: [
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Filtering not implemented yet')));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Search not implemented yet')));
                  },
                ),
              ],
              child: const KnowledgeListPage(category: 'Modules'),
            ),
      ),
      GoRoute(
        path: '/knowledge/masterclass',
        builder:
            (context, state) => ScaffoldWithDrawer(
              title: 'Masterclass',
              actions: [
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Filtering not implemented yet')));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Search not implemented yet')));
                  },
                ),
              ],
              child: const KnowledgeListPage(category: 'Masterclass'),
            ),
      ),
      GoRoute(
        path: '/knowledge/webinars',
        builder:
            (context, state) => ScaffoldWithDrawer(
              title: 'Webinars',
              actions: [
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Filtering not implemented yet')));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Search not implemented yet')));
                  },
                ),
              ],
              child: const KnowledgeListPage(category: 'Webinars'),
            ),
      ),
      GoRoute(
        path: '/knowledge/clinical-practices',
        builder:
            (context, state) => ScaffoldWithDrawer(
              title: 'Clinical Practices',
              actions: [
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Filtering not implemented yet')));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Search not implemented yet')));
                  },
                ),
              ],
              child: const KnowledgeListPage(category: 'Clinical Practices'),
            ),
      ),
      GoRoute(
        path: '/knowledge/clinical-tests',
        builder:
            (context, state) => ScaffoldWithDrawer(
              title: 'Clinical Tests',
              actions: [
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Filtering not implemented yet')));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Search not implemented yet')));
                  },
                ),
              ],
              child: const KnowledgeListPage(category: 'Clinical Tests'),
            ),
      ),
    ],
  );
});
