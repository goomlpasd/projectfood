import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'รายการอาหาร',
      theme: ThemeData(
        textTheme: GoogleFonts.sarabunTextTheme(
            Theme.of(context).textTheme), // ใช้ฟอนต์ Google Fonts (Sarabun)
        primarySwatch: Colors.orange,
      ),
      home: FoodListScreen(), // หน้าหลักแสดงรายการอาหาร
    );
  }
}
