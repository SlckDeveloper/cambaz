import 'package:cambaz/main.dart';
import 'package:cambaz/screens/authanticationScreens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

///KARŞILAMA EKRANI


class OnBoardWidget extends StatefulWidget {
  const OnBoardWidget({Key? key}) : super(key: key);

  @override
  State<OnBoardWidget> createState() => _OnBoardWidgetState();
}

class _OnBoardWidgetState extends State<OnBoardWidget> {
  bool? _girisYapildiMi;


  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if(user == null){
        print("++++++++++++++++++++++++++++++++++user: $user");
        print("++++++++++++++++++++++++++++++++++user: $_girisYapildiMi");
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
    print("--------------------------------------------------OnBoard build çalıştı");
    print("-------------------------------------------------- _girisYapidiMi: $_girisYapildiMi");
    return _girisYapildiMi == null ? const Center(child: CircularProgressIndicator()) : _girisYapildiMi!
        ? const MyHomePage(title: "CAMBAZ") : const SignInScreen();
  }
}
