import 'package:flutter/material.dart';

class AnimalHomeScreenWidget extends StatefulWidget {
  const AnimalHomeScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimalHomeScreenWidget> createState() => _AnimalHomeScreenWidget();
}

class _AnimalHomeScreenWidget extends State<AnimalHomeScreenWidget> {
  bool isDoubleTapped = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isDoubleTapped == false) {
            isDoubleTapped = true;
          } else {
            isDoubleTapped = false;
          }
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 2, bottom: 4),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                  )
                ],
              ),
              width:
                  isDoubleTapped == false ? screenWidth * 0.47 : screenWidth * 0.96,
              height: isDoubleTapped == false ? screenWidth * 0.7 : screenWidth*1.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      width: isDoubleTapped == false
                          ? screenWidth * 0.45
                          : screenWidth * 0.9,
                      height: isDoubleTapped == false
                          ? screenWidth * 0.4
                          : screenWidth * 0.8,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              //"https://anadoluhayvancilik.com/wp-content/uploads/2022/11/inek-kac-yil-yasar-inegin-ortalama-omru-ne-kadardir.jpg"
                               "https://www.yabanihayvanlar.com/wp-content/uploads/2021/05/inek.jpg"
                              ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "İnek",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple),
                          ),
                          Text(
                            "42.000 TL",
                            style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, bottom: 5, top: 5),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              //TODO: Kullanıcıya, paylaş ekranında 50 karakter açıklama metni girme izni verilebilir
                                "Kurbanlık 400kg inek..."),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.location_on_sharp,
                            color: Colors.blueGrey,
                            size: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "KAHRAMANMARAŞ",
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0, bottom: 4),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                  )
                ],
              ),
              width:
              isDoubleTapped == false ? screenWidth * 0.47 : screenWidth * 0.96,
              height: isDoubleTapped == false ? screenWidth * 0.7 : screenWidth*1.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      width: isDoubleTapped == false
                          ? screenWidth * 0.45
                          : screenWidth * 0.9,
                      height: isDoubleTapped == false
                          ? screenWidth * 0.4
                          : screenWidth * 0.8,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://anadoluhayvancilik.com/wp-content/uploads/2022/11/inek-kac-yil-yasar-inegin-ortalama-omru-ne-kadardir.jpg"
                            // "https://www.yabanihayvanlar.com/wp-content/uploads/2021/05/inek.jpg"
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "İnek",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple),
                          ),
                          Text(
                            "35.000 TL",
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, bottom: 5, top: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            //TODO: Kullanıcıya, paylaş ekranında 50 karakter açıklama metni girme izni verilebilir
                              "3 yaşında düve, 300 kg, gibi maşallah..."),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.location_on_sharp,
                            color: Colors.blueGrey,
                            size: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "ANKARA",
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
