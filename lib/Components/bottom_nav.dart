import 'package:flutter/material.dart';
import 'package:intertoons_ruz/Screens/accounts_screen.dart';
import 'package:intertoons_ruz/Screens/home_screen.dart';
import 'package:intertoons_ruz/Screens/menu_screen.dart';
import 'package:intertoons_ruz/Screens/search_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  List<Widget> ScreenItems = [
    const HomeScreen(),
    MenuScreen(),
    SearchScreen(),
    AccountScreen()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenItems[currentIndex],
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  currentIndex =0;

                });
              },
              child: SizedBox(
                height: 45,
                width: 50,
                child: Column(
                  children:  [
                    Icon(Icons.home,color: currentIndex ==0?Colors.redAccent:Colors.grey[500]),
                    Text("Home",style: TextStyle(fontSize: 12,color: currentIndex ==0?Colors.redAccent:Colors.grey[500],),),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  currentIndex =1;

                });
              },
              child: SizedBox(
                height: 45,
                width: 50,
                child: Column(
                  children:  [
                    Icon(Icons.menu,color: currentIndex ==1?Colors.redAccent:Colors.grey[500]),
                    Text("Menu",style: TextStyle(fontSize: 12,color: currentIndex ==1?Colors.redAccent:Colors.grey[500],),),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  currentIndex =2;

                });
              },
              child: SizedBox(
                height: 45,
                width: 50,
                child: Column(
                  children:  [
                    Icon(Icons.search,color: currentIndex ==2?Colors.redAccent:Colors.grey[500]),
                    Text("Search",style: TextStyle(fontSize: 12,color: currentIndex ==2?Colors.redAccent:Colors.grey[500],),),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  currentIndex =3;

                });
              },
              child: SizedBox(
                height: 45,
                width: 55,
                child: Column(
                  children:  [
                    Icon(Icons.account_box,color: currentIndex ==3?Colors.redAccent:Colors.grey[500]),
                    Text("Accounts",style: TextStyle(fontSize: 12,color: currentIndex ==3?Colors.redAccent:Colors.grey[500],),),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
