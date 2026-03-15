import 'package:flutter/material.dart';
import 'package:tugas1/pages/homepage.dart';

class PerkalianPage extends StatefulWidget {
  const PerkalianPage({Key? key}) : super(key: key);

  @override
  _PerkalianPageState createState() => _PerkalianPageState();
}

class _PerkalianPageState extends State<PerkalianPage> {
  TextEditingController angka1Controller = TextEditingController();
  TextEditingController angka2Controller = TextEditingController();
  String hasil = "0";
  String errorMessage = "";

  void hitungPerkalian() {
    setState(() {
      if (angka1Controller.text.length > 15 || angka2Controller.text.length > 15) {
        errorMessage = "Maksimal 15 karakter untuk setiap input";
        hasil = "0";
      } else if (!RegExp(r'^\d+$').hasMatch(angka1Controller.text) || !RegExp(r'^\d+$').hasMatch(angka2Controller.text)) {
        errorMessage = "Masukkan hanya angka";
        hasil = "0";
      } else {
        BigInt angka1 = BigInt.parse(angka1Controller.text);
        BigInt angka2 = BigInt.parse(angka2Controller.text);
        hasil = (angka1 * angka2).toString();
        errorMessage = "";
      }
    });
  }

  @override
  void dispose() {
    angka1Controller.dispose();
    angka2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepages()));
              },
            ),
            SizedBox(width: 10),
            Text(
              "Perkalian",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: angka1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Angka Pertama",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: angka2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Angka Kedua",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 10.0),
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: hitungPerkalian,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                "HITUNG",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Hasil Perkalian:",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    hasil,
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
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
