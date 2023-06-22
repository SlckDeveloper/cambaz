import 'package:cambaz/screens/authanticationScreens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cambaz/services/auth.dart';
import 'package:cambaz/widgets/sign_button.dart';
import '../../services/form_validators.dart';
import '../../utilities/snack_bar_messages.dart';

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
  bool _isLoadingEmailAndPasswordButton = false;
  bool _isLoadingAnonymouslyButton = false;

  @override
  void initState() {
    Auth().googleSignOut();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            //background: linear-gradient(90deg, #310091, #4811a0, #5c20b0, #702ebf, #843ccf, #974adf, #ab58ef, #bf66ff);
            Color(0xff310091),
            Color(0xff4811a0),
            Color(0xff5c20b0),
            Color(0xff702ebf),
            Color(0xff843ccf),
            Color(0xff974adf),
            Color(0xffab58ef),
            Color(0xffab58ef),
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
                        _isLoadingEmailAndPasswordButton == true
                            ? const CircularProgressIndicator(
                                color: Colors.white70,
                              )
                            : SignButton(
                                onPressed: _isLoading == true
                                    ? null
                                    : () async {
                                        if (_signInFormKey.currentState
                                                ?.validate() ==
                                            true) {
                                          setState(() {
                                            _isLoading = true;
                                            _isLoadingEmailAndPasswordButton =
                                                true;
                                          });
                                          try {
                                            UserCredential? userCredential =
                                                await Auth()
                                                    .signInWithEmailAndPassword(
                                                        tecEmail.text,
                                                        tecPassword.text);
                                          } on FirebaseAuthException catch (e) {
                                            if (e.code == 'user-not-found') {
                                              SnackBarMessages().snackBar(
                                                  context, "snackBar1");
                                            } else if (e.code ==
                                                'wrong-password') {
                                              SnackBarMessages().snackBar(
                                                  context, "snackBar2");
                                            }
                                          } catch (e) {
                                            SnackBarMessages()
                                                .sncBar(e.toString());
                                          }
                                        }
                                        await Future.delayed(
                                            const Duration(seconds: 2));
                                        setState(() {
                                          _isLoading = false;
                                          _isLoadingEmailAndPasswordButton =
                                              false;
                                        });
                                      },
                                buttonText: "Giriş Yap",
                              ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  SignButton(
                    onPressed: _isLoading == true
                        ? null
                        : () async {
                            setState(() {
                              _isLoading = true;
                            });
                            try {
                              UserCredential? userCredential =
                                  await Auth().signInWithGoogle();
                            } catch (e) {
                              await Future.delayed(const Duration(seconds: 2));
                              SnackBarMessages().snackBar(context, "snackBar3");
                              setState(() {
                                _isLoading = false;
                              });
                            }
                            setState(() {
                              _isLoading = false;
                            });
                          },
                    buttonText: "Google ile Gir",
                  ),
                  const Divider(height: 20),
                  _isLoadingAnonymouslyButton == true
                      ? const CircularProgressIndicator(
                          color: Colors.white70,
                        )
                      : SignButton(
                          onPressed: _isLoading == true
                              ? null
                              : () async {
                                  setState(() {
                                    _isLoading = true;
                                    _isLoadingAnonymouslyButton = true;
                                  });
                                  try {
                                    await Auth().signInAnonymously();
                                  } catch (e) {
                                    await Future.delayed(
                                        const Duration(seconds: 2));
                                    SnackBarMessages()
                                        .snackBar(context, "snackBar3");
                                    setState(() {
                                      _isLoading = false;
                                      _isLoadingAnonymouslyButton = false;
                                    });
                                  }
                                  setState(() {
                                    _isLoading = false;
                                    _isLoadingAnonymouslyButton = false;
                                  });
                                },
                          buttonText: "Kayıt Olmadan Gir",
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
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
                                fontSize: 17),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Şifremi Unuttum!",
                          style: TextStyle(
                              color: Color(0xff1f005c),
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
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

//TODO: Şifremi unuttum sayfası düzenlenmeli!!!
