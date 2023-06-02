import 'package:flutter/material.dart';
import 'package:cambaz/services/auth.dart';
import 'package:cambaz/widgets/sign_in_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPassword = TextEditingController();
  bool progress = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color(0xff1f005c),
            Color(0xff5b0060),
            Color(0xff870160),
            Color(0xffac255e),
            Color(0xffca485c),
            Color(0xffe16b5c),
            Color(0xfff39060),
            Color(0xffffb56b),
          ], // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.amber.withOpacity(0),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: tecEmail,
                  decoration: const InputDecoration(hintText: "e-mail"),
                ),
                TextField(
                  controller: tecPassword,
                  decoration: const InputDecoration(hintText: "password"),
                ),
                const SizedBox(
                  height: 15,
                ),
                SignInButton(
                    onPressed: () async {
                      await Auth()
                          .signInWithEmailAndPassword(tecEmail, tecPassword);
                    },
                    buttonText: "Giriş Yap", ),
                const SizedBox(
                  height: 70,
                ),
                SignInButton(onPressed: () {}, buttonText: "Google ile Gir",),
                const Divider(height: 20),
                SignInButton(
                    onPressed: () async {
                      await Auth().signInAnonymously();
                    },
                    buttonText: "Kayıt Olmadan Gir", ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  TextButton(onPressed: (){}, child: const Text("Üye Ol", style: TextStyle(color:  Color(0xff1f005c), fontWeight: FontWeight.bold, fontSize: 15),)),
                  const SizedBox(width: 20,),
                  TextButton(onPressed: (){}, child: const Text("Şifremi Unuttum!", style: TextStyle(color:  Color(0xff1f005c), fontWeight: FontWeight.bold, fontSize: 15),),),
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

