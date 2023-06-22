import 'package:cambaz/main.dart';
import 'package:cambaz/screens/authanticationScreens/sign_in_screen.dart';
import 'package:cambaz/screens/on_board_screen.dart';
import 'package:cambaz/widgets/sign_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';
import '../../services/form_validators.dart';
import '../../utilities/snack_bar_messages.dart';

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
  bool _butonaBasildiMi= true;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            //background: linear-gradient(90deg, #3d33ff, #0057ff, #0071ff, #0086ff, #0098ff, #00a9ff, #00b9ff, #38c7ff);

            Color(0xff3d33ff),
            Color(0xff0057ff),
            Color(0xff0071ff),
            Color(0xff0086ff),
            Color(0xff0098ff),
            Color(0xff00a9ff),
            Color(0xff00b9ff),
            Color(0xff38c7ff),
          ], // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.amber.withOpacity(0),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: [
                    const CircleAvatar(backgroundColor: Color(0xff38c7ff),
                      radius: 80,
                      child: Icon(Icons.person, size: 130, color: Color(0xff0071ff)),
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
                  Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
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
                            hintText: "     Ad  Soyad",
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
                        _butonaBasildiMi == false ? const CircularProgressIndicator() : SignButton(
                            onPressed: () async{
                              if(_signUpFormKey.currentState?.validate()==true) {
                                setState(() {
                                  _butonaBasildiMi = false;
                                });
                              }else{
                                return null;
                              }
                              try {
                                await Auth().createWithEmailAndPassword(
                                    tecEmail.text, tecPassword.text);
                                FirebaseAuth.instance.authStateChanges().listen((
                                    user) {
                                  //TODO: Burada giriş kontrolleri daha detaylı yapılarak yönlendirme gerçekleştirilmeli
                                  if (user != null) {
                                    Navigator.push(context, MaterialPageRoute(builder:(context) => const OnBoardScreen()),);
                                  }});
                              }catch(e){
                                await Future.delayed(
                                    const Duration(seconds: 3));
                                SnackBarMessages().snackBar(context, "snackBar3");
                                setState(() {
                                  _butonaBasildiMi = true;
                                });
                              }
                            },
                            buttonText: "Kaydol"),
                      ],
                    ),
                  ),

                  SizedBox(height: 20,),
                  TextButton(
                      onPressed:() {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const SignInScreen()));
                      },
                      child: const Text(
                        "Giriş",
                        style: TextStyle(
                            color: Color(0xff1f005c),
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      )),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


//TODO: Form validate olayının çözülmesi gerekiyor!!
