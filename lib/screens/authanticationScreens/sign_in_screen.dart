import 'package:cambaz/screens/authanticationScreens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cambaz/services/auth.dart';
import 'package:cambaz/widgets/sign_in_button.dart';

import '../../services/form_validators.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPassword = TextEditingController();
  final _signInFormKey = GlobalKey<FormState>();

  //Butona tıklandığında butonun deaktif olması için, böylece birden fazla giriş yapılmasının önüne geçilir
  bool _isLoading = false;

  Future<void> _signInAnonymously() async {
    setState(() {
      _isLoading = true;
    });
    await Auth().signInAnonymously();
  }


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
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 45),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
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
                          height: 15,
                        ),
                        SignInButton(
                          onPressed: _isLoading == true ? null : () async {
                           if(_signInFormKey.currentState?.validate() == true ){
                             print("++++++++++++++++++++++++++++++ form validate oldu");
                            UserCredential? user = await Auth().signInWithEmailAndPassword(
                                tecEmail.text, tecPassword.text);
                             print("++++++++++++++++++++++++++++++ bağlantı sağlandı, user: $user");
                            if(user?.user != null){
                              if(!user!.user!.emailVerified){
                                await _dialogBuilder(context);
                            }
                            }else{

                            }

                           }
                          },
                          buttonText: "Giriş Yap",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  SignInButton(
                    onPressed: _isLoading == true
                        ? null
                        : () {
                            setState(() {
                              _isLoading = true;
                            });
                          },
                    buttonText: "Google ile Gir",
                  ),
                  const Divider(height: 20),
                  SignInButton(
                    onPressed: _isLoading == true ? null : _signInAnonymously,
                    buttonText: "Kayıt Olmadan Gir",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: _isLoading == true
                              ? null
                              : () {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpScreen()));
                                },
                          child: const Text(
                            "Üye Ol",
                            style: TextStyle(
                                color: Color(0xff1f005c),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: _isLoading == true
                            ? null
                            : () {
                                setState(() {
                                  _isLoading = true;
                                });
                              },
                        child: const Text(
                          "Şifremi Unuttum!",
                          style: TextStyle(
                              color: Color(0xff1f005c),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Email adresinizi kontrol ediniz!'),
          content: const Text(
            'Lütfen email adresinizi onaylamak için\n'
                'mail adresinize göndermiş olduğumuz\n'
                'linke tıklayarak onaylama işlemini tamamlayınız.',
          ),
          actions: <Widget>[
            /*TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Kapat'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),*/
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Anladım'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
