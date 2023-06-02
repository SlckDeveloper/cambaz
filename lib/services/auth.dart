import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth{
  final _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signInAnonymously() async{
    UserCredential userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  Future<void> signOut() async{
     await _firebaseAuth.signOut();
  }

  Future<void> signInWithEmailAndPassword(TextEditingController email, TextEditingController password) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email.toString(), password: password.toString());
  }

  Future<void> signUpWithEmailAndPassword() async{

  }

}