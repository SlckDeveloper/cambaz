import 'package:cambaz/services/auth.dart';
import 'package:cambaz/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchTextController = TextEditingController();
  String resimUrl = "https://anadoluhayvancilik.com/wp-content/uploads/2022/11/inek-kac-yil-yasar-inegin-ortalama-omru-ne-kadardir.jpg";



  @override
  void dispose() {
        super.dispose();
        searchTextController.dispose();
  }


  @override
  Widget build(BuildContext context) {
   // final double screenWidth = MediaQuery.of(context).size.width;
   // final double halfScreenWidth = screenWidth/2;


    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        actions: [IconButton(onPressed: () async{
          await Provider.of<Auth>(context, listen: false).signOut();
        }, icon: const Icon(Icons.logout))],
        title:
      TextField(
        cursorColor: const Color(0x1B4052FF),
        decoration: const InputDecoration(icon: Icon(Icons.search),
          focusColor: Colors.lightBlueAccent,
        hintText: " Ara...",
      ),
        controller: searchTextController,
        onChanged: (value){
        },
      ),
      ),
      body: ListView.builder(itemBuilder: (_, index) => PostWidget(searchTextController: searchTextController, resimUrl: resimUrl,),
      itemCount: 20,),
    );
  }
}

/*
RefreshIndicator(
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
*/