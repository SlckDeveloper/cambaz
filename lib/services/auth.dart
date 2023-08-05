import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth{
  final _firebaseAuth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;
  String? profilResmiUrl = "false";


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

  Future<void> createWithEmailAndPassword(String email, String password, String username, Uint8List? profilResmi) async {
    UserCredential userCred = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    if(profilResmi != null) {
      final path = await _storage.ref().child("profilResimleri").child(userCred.user!.uid);
      UploadTask uploadTask = path.putData(profilResmi);
      profilResmiUrl = await (await uploadTask).ref.getDownloadURL();
    }
    await  _fireStore.collection('users').doc(userCred.user!.uid).set({
        "email": email,
        "password": password,
        "username": username,
        "followers": [],
        "following": [],
        "userid": userCred.user!.uid,
        "profilResmiUrl": profilResmiUrl,

        //TODO: Eğer veritabanında (Cloud Firestore) kullanicilar adında bir koleksiyon varsa
        //TODO: ve/veya userCred.user!.uid adında bir döküman varsa ve/veya set bilgileri varsa
        //TODO: yeni bilgileri var olan alanın üzerine yazacaktır. Eğer ilgili alanlardan herhangi
        //TODO: birisi veya hepsi yoksa olmayan alanları baştan oluşturacaktır.
      });
  }


  Future<String?> downloadProfilePic() async{
    print("1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111");
    User? user = _firebaseAuth.currentUser;
    print("22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222");
    if(user != null) {
      print("33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333");
      final ref = _fireStore.collection('users').doc(user.uid);
      print("44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444 ref:"+ref.toString());
      DocumentSnapshot kullaniciVerileriMap = await ref.get();
      print("55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555 KullanıcıVerileriMap:" + kullaniciVerileriMap.toString());
      print("66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666 KullanıcıVerileriMAp['profilResmiURl'] :" +kullaniciVerileriMap["profilResmiUrl"].toString());
      return kullaniciVerileriMap["profilResmiUrl"].toString();
    }
    return null;
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