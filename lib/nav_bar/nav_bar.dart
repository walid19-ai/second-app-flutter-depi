

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:depi_bloc/home/home.dart';
import 'package:depi_bloc/main_search_screen/main_search_screen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

 List<Widget>screen =[HomeScreen(),MainSearchScreen()];
 int currIndex=0;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
  body:screen[currIndex],
      bottomNavigationBar: CurvedNavigationBar(
      backgroundColor: Colors.white,
      buttonBackgroundColor: Colors.amber,
      color: Color(0xff001F3F),
      items: <Widget>[
        Icon(Icons.home, size: 30,color: Colors.white),
        Icon(Icons.search_sharp, size: 30,color: Colors.white),

      ],
      index: currIndex,
      onTap: (index) {
      setState(() {
        currIndex=index;
      });
      },
    ),
    );
  }
}
