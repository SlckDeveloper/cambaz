import 'package:flutter/material.dart';

class SnackBarMessages {


  void snackBar(BuildContext context, String snackBarName){
      const snackBar1 =  SnackBar(
      content: Text('Kullanıcı bulunamadı!'),
    );
      const snackBar2 =  SnackBar(
        content: Text('Yanlış şifre!'),
      );
      const snackBar3 =  SnackBar(
        content: Text('Bağlantı sağlanamadı!'),
      );

      ScaffoldMessenger.of(context)
          .showSnackBar(
          snackBarName == "snackBar1" ? snackBar1 : snackBarName == "snackBar2" ? snackBar2
            :snackBar3

      );
  }

  SnackBar sncBar(String e) {
    return SnackBar(content: Text(e));
  }




// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
 // ScaffoldMessenger.of(context).showSnackBar(snackBar);

}

/*
static const snackBar1 = SnackBar(
  content: Text('Kullanıcı bulunamadı!'),
);
static const snackBar2 = SnackBar(
  content: Text('Yanlış şifre girdiniz!'),
);
static const snackBar3 = SnackBar(
  content: Text('Bağlantı sağlanamadı!'),
);
SnackBar _snackBar(String e) {
  return SnackBar(content: Text(e));
}

switch (snackBarName){
          case "snackBar1" : snackBar1;
          break;
          case "snackBar2" : snackBar2;
          break;
          case "snackBar3" : snackBar3;
          break;
          default: snackBar3;
}

 */