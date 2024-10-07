import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // สำหรับ Google Fonts
import 'dart:convert'; // สำหรับการอ่าน JSON
import 'details.dart';
import 'package:flutter/services.dart';

class FoodListScreen extends StatefulWidget {
  @override
  _FoodListScreenState createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  List<dynamic> foodItems = [];

  @override
  void initState() {
    super.initState();
    loadFoodData(); // โหลดข้อมูลอาหารจาก JSON เมื่อเริ่มต้นหน้าจอ
  }

  // ฟังก์ชันโหลดข้อมูลจาก JSON
  Future<void> loadFoodData() async {
    final String response = await rootBundle
        .loadString('assets/data/data.json'); // โหลดไฟล์จาก assets
    final data = await json.decode(response); // แปลง JSON เป็น List
    setState(() {
      foodItems = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('เมนูอาหาร',
            style: GoogleFonts.sarabun()), // ใช้ฟอนต์ Sarabun ใน AppBar
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // สามารถเพิ่มฟังก์ชันการค้นหาได้
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://i.pinimg.com/736x/e7/07/01/e7070191098eeacdb4f3587252bc5108.jpg', // URL ของภาพพื้นหลังดอกไม้สีชมพู
            ),
            fit: BoxFit.cover, // ขยายรูปให้เต็มหน้าจอ
          ),
        ),
        child: foodItems.isNotEmpty
            ? ListView.builder(
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  var item = foodItems[index];
                  return GestureDetector(
                    onTap: () {
                      // เมื่อกดที่รายการอาหาร ส่งข้อมูลไปยังหน้าจอรายละเอียด
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailScreen(item: item),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.all(10),
                      elevation: 6,
                      child: ListTile(
                        leading: item['image'].startsWith('http')
                            ? Image.network(item['image'],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover) // รูปจาก URL
                            : Image.asset(item['image'],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover), // รูปจาก assets
                        title: Text(item['name'],
                            style:
                                GoogleFonts.sarabun(fontSize: 18)), // ชื่ออาหาร
                        subtitle: Text('${item['price']} บาท',
                            style:
                                GoogleFonts.sarabun(fontSize: 16)), // ราคาอาหาร
                      ),
                    ),
                  );
                },
              )
            : Center(
                child:
                    CircularProgressIndicator()), // แสดง Loading ขณะโหลดข้อมูล
      ),
    );
  }
}
