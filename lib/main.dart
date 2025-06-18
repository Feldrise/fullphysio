import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme.dart';
import 'core/widgets/firebase_init.dart';
import 'features/navigation/router.dart';

void main() {
  runApp(const ProviderScope(child: FirebaseInit(child: MainApp())));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(title: 'Fullphysio', theme: lightTheme, darkTheme: darkTheme, themeMode: ThemeMode.light, routerConfig: router);
  }
}
