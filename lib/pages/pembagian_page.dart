import 'package:flutter/material.dart';
import 'package:tugas1/pages/homepage.dart';

class PembagianPage extends StatefulWidget {
  const PembagianPage({Key? key}) : super(key: key);

  @override
  _PembagianPageState createState() => _PembagianPageState();
}

class _PembagianPageState extends State<PembagianPage> {
  TextEditingController angka1Controller = TextEditingController();
  TextEditingController angka2Controller = TextEditingController();
  String hasil = "0";
  String errorMessage = "";

  void hitungPembagian() {
    setState(() {
      if (angka1Controller.text.length > 15 || angka2Controller.text.length > 15) {
        errorMessage = "Maksimal 15 karakter untuk setiap input";
        hasil = "0";
      } else if (!RegExp(r'^\d+$').hasMatch(angka1Controller.text) || !RegExp(r'^\d+$').hasMatch(angka2Controller.text)) {
        errorMessage = "Masukkan hanya angka";
        hasil = "0";
      } else {
        int angka1 = int.parse(angka1Controller.text);
        int angka2 = int.parse(angka2Controller.text);
        if (angka2 == 0) {
          errorMessage = "Tidak dapat membagi dengan nol";
          hasil = "0";
        } else {
          double resultDouble = angka1 / angka2;
          hasil = resultDouble == resultDouble.truncateToDouble()
              ? resultDouble.toInt().toString()
              : resultDouble.toStringAsFixed(2);
          errorMessage = "";
        }
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
              "Pembagian",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.purple[700],
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
                labelText: "Angka Pertama (Pembilang)",
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
                labelText: "Angka Kedua (Penyebut)",
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
              onPressed: hitungPembagian,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[700],
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
                color: Colors.purple.shade100,
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
                    "Hasil Pembagian:",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    hasil,
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[800],
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
