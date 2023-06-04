import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Auth{
  final _firebaseAuth = FirebaseAuth.instance;

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZwHFFts_77_6lYePZhxEVe4Dh6c-Znnc',
    appId: '1:752297614246:android:4b4219af4d8a2d137f0d67',
    messagingSenderId: '752297614246',
    projectId: 'cambaz-8213e',
    storageBucket: 'dev.sarstech.cambaz',
  );

  Future<User?> signInAnonymously() async{
    UserCredential userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  Future<void> signOut() async{
     await _firebaseAuth.signOut();
  }

  Future<void> createWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }


}