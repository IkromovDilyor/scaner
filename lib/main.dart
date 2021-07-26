import 'package:flutter/material.dart';
import 'package:scaner/pages/home_page.dart';
import 'package:scaner/pages/qr_scaner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:HomePage(),
      routes: {
        ScanPage.id:(context)=>ScanPage(),
      },
    );
  }
}



