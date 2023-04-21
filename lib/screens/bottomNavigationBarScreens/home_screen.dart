import 'package:cambaz/widgets/bottomNavigationBarWidgets/animal_home_screen_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchTextController = TextEditingController();

  @override
  void dispose() {
        super.dispose();
        searchTextController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double halfScreenWidth = screenWidth/2;


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: TextField(
        cursorColor: Colors.lightBlueAccent,
        decoration: const InputDecoration(icon: Icon(Icons.search),
          focusColor: Colors.lightBlueAccent,
        hintText: " Ara...",
      ),
        controller: searchTextController,
        onChanged: (value){
        },
      ),

      ),
      body: RefreshIndicator(
        onRefresh: () async{
          //TODO: Buraya kullanıcı refresh ettiğinde yeni içeriklerin gelmesini, ekran arayüzünün
          //TODO: güncellenmsini sağlayan fonksiyonu yaz.

          //Sayfa refresh edildiğinde arama yerinde herhangi bir metin varsa bu metni silelim
          searchTextController.text="";
          setState(() {
            searchTextController;
          });
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: const [
                    AnimalHomeScreenWidget(),
                    Expanded(
                      child: Text(""),
                    ),
                    AnimalHomeScreenWidget(),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: const [
                    AnimalHomeScreenWidget(),
                    Expanded(
                      child: Text(""),
                    ),
                    AnimalHomeScreenWidget(),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: const [
                    AnimalHomeScreenWidget(),
                    Expanded(
                      child: Text(""),
                    ),
                    AnimalHomeScreenWidget(),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: const [
                    AnimalHomeScreenWidget(),
                    Expanded(
                      child: Text(""),
                    ),
                    AnimalHomeScreenWidget(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
