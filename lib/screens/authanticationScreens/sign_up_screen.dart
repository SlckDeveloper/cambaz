import 'package:cambaz/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';
import '../../services/form_validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPassword = TextEditingController();
  TextEditingController tecAdSoyad = TextEditingController();
  final _signUpFormKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color(0xff461e5c),
            Color(0xff30418a),
            Color(0xff0064b2),
            Color(0xff0087cb),
            Color(0xff00a8d3),
            Color(0xff00c7cb),
            Color(0xff00e5b7),
            Color(0xff6eff9c),
          ], // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.amber.withOpacity(0),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _signUpFormKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 45),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/insanprofil.jpg"),
                        //NetworkImage(
                          //  "https://yt3.googleusercontent.com/ytc/AGIKgqM8zh66fZqGKeTkopHaU9GM4zvyuFnQhXThr37u=s900-c-k-c0x00ffffff-no-rj"),
                        radius: 80,
                      ),
                      Positioned(
                        right: 3,
                        bottom: 15,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_a_photo, size: 40),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Profil resmi yükleyin",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "İsim alanı boş bırakılamaz";
                        } else {
                          return null;
                        }
                      },
                      controller: tecAdSoyad,
                      decoration: InputDecoration(
                        hintText: "Ad Soyad",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      validator: (value) {
                        return FormValidators().validateEmail(value);
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: tecEmail,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        hintText: "e-mail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      validator: (value) {
                        return FormValidators().validatePassword(value);
                      },
                      obscureText: true,
                      controller: tecPassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "şifre",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    SignInButton(
                        onPressed: () async{
                          _signUpFormKey.currentState?.validate();
                          await Auth().createWithEmailAndPassword(tecEmail.text, tecPassword.text);
                        },
                        buttonText: "Kaydol")
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//TODO: Form uyarı metinleri kırmızı renkte olduğu için arka plan rengi ile karışıyor, düzeltilmesi gerek
//TODO: Şifre kontrolündeki hata metni çok uzun olduğundan ekrana sığmıyor, düzeltilmesi gerek. Düzeltilemiyorsa uyarıyı bir uyarı ekranında kullanıcıya gösterebiriz.
