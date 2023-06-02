import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPassword = TextEditingController();
  TextEditingController tecAdSoyad = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: tecAdSoyad,
              decoration: const InputDecoration(hintText: "Ad Soyad"),
            ),
            TextField(
              controller: tecEmail,
              decoration: const InputDecoration(hintText: "e-mail"),
            ),
            TextField(
              controller: tecPassword,
              decoration: const InputDecoration(hintText: "password"),
            ),
            ElevatedButton(
              onPressed: () {

              },
              child: const Text("Kaydol"),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Google ile Giriş Yap"),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text("Kaydolmadan Giriş Yap"),
            ),
            const Text("user null çıktı!"),
          ],
        ),
      ),
    );
  }
}
