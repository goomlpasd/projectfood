import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'Home.dart';

class PriceDetailScreen extends StatelessWidget {
  final int price;
  final String foodName;

  PriceDetailScreen({required this.price, required this.foodName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false, // ซ่อนปุ่มย้อนกลับ
        title: Text(
          '$foodName',
          style: GoogleFonts.sarabun(),
        ), // ชื่ออาหารใน AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'สั่งออเดอร์แล้ว',
              style: GoogleFonts.sarabun(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff000000)),
            ),
            SizedBox(height: 20), // เพิ่มระยะห่าง
            CupertinoButton(
              color: Colors.blue, // สีของปุ่ม
              onPressed: () {
                // เพิ่มการทำงานเมื่อกดปุ่ม เช่น เปลี่ยนหน้าไปยังหน้าถัดไป
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FoodListScreen()), // เปลี่ยนไปยังหน้า Home หรือหน้าที่คุณต้องการ
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(CupertinoIcons.home), // ไอคอนของ Cupertino
                  SizedBox(width: 10), // ระยะห่างระหว่างไอคอนและข้อความ
                  Text(
                    'Home', // ข้อความบนปุ่ม
                    style: GoogleFonts.sarabun(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
