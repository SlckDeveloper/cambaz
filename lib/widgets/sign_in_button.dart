

import 'package:flutter/material.dart';


class SignInButton extends StatelessWidget {
   SignInButton({
    super.key,
    required this.onPressed, required this.buttonText
  });
   String buttonText;
  Function() onPressed;


  @override
  Widget build(BuildContext context) {
    final double screenSize = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 50,
      width: screenSize * 0.7,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) {
            // If the button is pressed, return green, otherwise blue
            if (states.contains(MaterialState.pressed)) {
              return const Color(0xff5b0060);
            }
            return const Color(0xffe16b5c);
          }),
          textStyle: MaterialStateProperty.resolveWith((states) {
            // If the button is pressed, return size 25, otherwise 18
            if (states.contains(MaterialState.pressed)) {
              return const TextStyle(fontSize: 23,fontWeight: FontWeight.bold);
            }
            return const TextStyle(fontSize: 19, fontWeight: FontWeight.bold);
          }),
        ),
        onPressed: onPressed,
        child:  Text(buttonText),
      ),
    );
  }
}