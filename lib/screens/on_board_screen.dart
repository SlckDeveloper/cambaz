import 'package:cambaz/main.dart';
import 'package:cambaz/screens/authanticationScreens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

///KARŞILAMA EKRANI


class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  bool? _girisYapildiMi;


  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if(user == null){
      _girisYapildiMi = false;
    }else{
        _girisYapildiMi = true;
      }
    setState(() {
      _girisYapildiMi;
    });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _girisYapildiMi == null ? const Center(child: CircularProgressIndicator()) : _girisYapildiMi!
        ? const MyHomePage() : const SignInScreen();
  }
}
