import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;


  Future<User?> userSignInAnonymously()  async{
    final userCredential = await auth.signInAnonymously();
    user = userCredential.user;
    return user;
  }

  @override
  void initState() {
    super.initState();
    userSignInAnonymously();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: user == null ? CircularProgressIndicator() : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(decoration: InputDecoration(hintText: "e-mail"),),
          TextField(decoration: InputDecoration(hintText: "password"),),
          ElevatedButton(onPressed: (){}, child: Text("Giriş Yap"),),
          Divider(),
          ElevatedButton(onPressed: (){}, child: Text("GOOGLE ile Giriş Yap"),),
          Divider(),
          ElevatedButton(onPressed: (){}, child: Text("Kaydolmadan Giriş Yap"),),
        ],
      ),),
    );
  }
}
