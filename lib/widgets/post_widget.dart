import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  const PostWidget(
      {Key? key, required this.searchTextController, required this.resimUrl})
      : super(key: key);
  final TextEditingController searchTextController;
  final String? resimUrl;

  @override
  State<PostWidget> createState() => _AnimalHomeScreenWidget();
}

class _AnimalHomeScreenWidget extends State<PostWidget> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14, bottom: 14, left: 14),
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
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      //"https://anadoluhayvancilik.com/wp-content/uploads/2022/11/inek-kac-yil-yasar-inegin-ortalama-omru-ne-kadardir.jpg"
                      widget.resimUrl == null
                          ? "https://www.yabanihayvanlar.com/wp-content/uploads/2021/05/inek.jpg"
                          : widget.resimUrl!,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
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
                            "92.000 TL",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
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
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (favorite == false) {
                            favorite = true;
                          }else{
                            favorite = false;
                          }
                        });
                      },
                      icon: favorite==false
                          ? Icon(Icons.favorite_border_outlined)
                          : Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
GestureDetector(
      onTap: () {
        setState(() {
          if (isPostTapped == false) {
            isPostTapped = true;
          } else {
            isPostTapped = false;
          }
        });
        widget.searchTextController.clear();
      },
      child:
      );
 */

/*
import 'package:flutter/material.dart';

class AnimalHomeScreenWidget extends StatefulWidget {
  const AnimalHomeScreenWidget({
    Key? key, required this.searchTextController,
  }) : super(key: key);
  final TextEditingController searchTextController;

  @override
  State<AnimalHomeScreenWidget> createState() => _AnimalHomeScreenWidget();
}

class _AnimalHomeScreenWidget extends State<AnimalHomeScreenWidget> {
  bool isLeftPostTapped = false;
  bool isRightPostTapped = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 2, bottom: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (isLeftPostTapped == false) {
                    isLeftPostTapped = true;
                    isRightPostTapped= false;
                  } else {
                    isLeftPostTapped = false;
                  }
                });
                widget.searchTextController.clear();
              },
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
                width: isLeftPostTapped == false ? isRightPostTapped == true ? screenWidth * 0 : screenWidth * 0.47  : screenWidth * 0.96,
                height: isLeftPostTapped == false ? screenWidth * 0.7 : screenWidth*1.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        width: isLeftPostTapped == false
                            ? isRightPostTapped == true ? screenWidth * 0 : screenWidth * 0.45
                            : screenWidth * 0.9,
                        height: isLeftPostTapped == false
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0, bottom: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (isRightPostTapped == false) {
                    isRightPostTapped = true;
                    isLeftPostTapped = false;
                  } else {
                    isRightPostTapped = false;
                  }
                });
                widget.searchTextController.clear();
              },
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
                isRightPostTapped == false ? isLeftPostTapped == true ? screenWidth * 0 : screenWidth * 0.47 : screenWidth * 0.96,
                height: isRightPostTapped == false ? screenWidth * 0.7 : screenWidth*1.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        width: isRightPostTapped == false
                            ? isLeftPostTapped == true ? screenWidth * 0 : screenWidth * 0.45
                            : screenWidth * 0.9,
                        height: isRightPostTapped == false
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
          ),
        ],

    );
  }
}

double postGenisligi(){

  return 3;
}
*/

/*
GestureDetector(
      onTap: () {
        setState(() {
          if (isPostTapped == false) {
            isPostTapped = true;
          } else {
            isPostTapped = false;
          }
        });
        widget.searchTextController.clear();
      },
      child:
      );
 */
