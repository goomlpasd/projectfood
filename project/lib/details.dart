import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'Home.dart';
import 'Price.dart';

class FoodDetailScreen extends StatelessWidget {
  final dynamic item;

  FoodDetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(item['name'],
            style: GoogleFonts.sarabun()), // ชื่ออาหารใน AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://i.pinimg.com/736x/e7/07/01/e7070191098eeacdb4f3587252bc5108.jpg', // URL รูปพื้นหลัง
            ),
            fit: BoxFit.cover, // ขยายรูปให้เต็มพื้นที่
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: item['image'].startsWith('http')
                    ? Image.network(
                        item['image'],
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
                      ) // รูปจาก URL
                    : Image.asset(
                        item['image'],
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
                      ), // รูปจาก assets
              ),
              SizedBox(height: 20), // เว้นบรรทัดระหว่างรูปกับชื่ออาหาร
              Text(
                item['name'],
                style: GoogleFonts.sarabun(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10), // เว้นบรรทัดระหว่างชื่ออาหารกับคำอธิบาย
              Text(
                item['description'],
                style: GoogleFonts.sarabun(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20), // เว้นบรรทัดระหว่างคำอธิบายกับกรอบราคา
              InkWell(
                onTap: () {
                  // ทำสิ่งที่ต้องการเมื่อผู้ใช้กดที่ราคา
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PriceDetailScreen(
                          price: item['price'], foodName: item['name']),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10.0), // ระยะห่างภายในกล่อง
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), // มุมโค้งของกล่อง
                    color: Colors.white
                        .withOpacity(0.8), // พื้นหลังกล่องสีขาวโปร่งใส
                    border: Border.all(
                      color: Colors.green, // สีของขอบ
                      width: 2, // ความหนาของขอบ
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // เงาสีเทา
                        spreadRadius: 2, // การกระจายของเงา
                        blurRadius: 5, // ความเบลอของเงา
                        offset: Offset(0, 3), // การเยื้องของเงา
                      ),
                    ],
                  ),
                  child: Text(
                    '${item['price']} บาท',
                    style: GoogleFonts.sarabun(
                      fontSize: 24,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
