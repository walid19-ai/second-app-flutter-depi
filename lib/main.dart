
import 'package:depi_bloc/insight/insight.dart';
import 'package:depi_bloc/search_result_screen/search_result_screen.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(
 const MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:InsightScreen(),
    );
  }
}

