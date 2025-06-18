import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Auth helpers
  static Future<User?> signInWithEmail(String email, String password) async {
    final result = await auth.signInWithEmailAndPassword(email: email, password: password);
    return result.user;
  }

  static Future<User?> signUpWithEmail(String email, String password) async {
    final result = await auth.createUserWithEmailAndPassword(email: email, password: password);
    return result.user;
  }

  static Future<User?> signInAnonymously() async {
    final result = await auth.signInAnonymously();
    return result.user;
  }

  static Future<void> signOut() async {
    await auth.signOut();
  }

  // Add more Firestore helpers as needed
}
