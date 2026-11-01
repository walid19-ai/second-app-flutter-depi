import 'package:flutter/material.dart';

import '../home/home.dart';
import '../nav_bar/nav_bar.dart';


class InsightScreen extends StatefulWidget {
  const InsightScreen({super.key});

  @override
  State<InsightScreen> createState() => _InsightScreenState();
}

class _InsightScreenState extends State<InsightScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const NavBar()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff001F3F),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Image.asset('assets/images/img.png',),



          ],
        ),
      ),
    );
  }
}