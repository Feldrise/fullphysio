import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fullphysio/firebase_options.dart';

class FirebaseInit extends StatelessWidget {
  final Widget child;
  const FirebaseInit({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return child;
        }
        if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text('Firebase init error: \\${snapshot.error}')));
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
