import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
     await GoogleSignIn().signOut();
  }

  Future<void> googleSignOut() async{
    await GoogleSignIn().signOut();
  }

  bool signOutControl(bool isSignOutAfterSignUp){
    if(isSignOutAfterSignUp==true){
      return true;
    }else{
    return false;
    }
  }

  Future<void> createWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser
          ?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await _firebaseAuth.signInWithCredential(credential);
    }
    catch(e){
      //TODO: buradaki hata yakalama olayı daha farklı seçeneklerle de düzenlenebilir!!
      UserCredential? userCred;
      return userCred;
    }
  }

/*
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<String> handleSignIn() async {
    try {
      await googleSignIn.signIn();
      return "Giriş başarılı";
    } catch (error) {
      return error.toString();
    }
  }
*/

}