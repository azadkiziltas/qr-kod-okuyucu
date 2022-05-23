import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class qrOlustur extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => qrOlusturDurum();
}

class qrOlusturDurum extends State<qrOlustur> {
  String qrVeri =
      "https://www.google.com"; //sayfa açıldığında otomatik olarak qr kodu oluşturulur.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 51, 102, 102),
        title: Text('QR Oluşturucu'),
        actions: <Widget>[],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "QR Oluşturucu",
              style: TextStyle(fontSize: 20.0),
            ),
            TextField(
              controller: qrdataFeed,
              decoration: InputDecoration(
                hintText: "Oluşturulacak veriyi girin",
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: FlatButton(
                padding: EdgeInsets.all(15.0),
                onPressed: () async {
                  if (qrdataFeed.text.isEmpty) {
                    //Metin girilen alanın boş olup olmadığını kontrol ediyoruz.
                    setState(() {
                      qrVeri = "";
                    });
                  } else {
                    setState(() {
                      qrVeri = qrdataFeed.text;
                    });
                  }
                },
                child: Text(
                  "QR Oluştur",
                  style: TextStyle(
                      color: Color.fromARGB(255, 51, 102, 102),
                      fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Color.fromARGB(255, 51, 102, 102), width: 3.0),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            QrImage(
              //QR kodunun gösterildiği kısım.
              data: qrVeri,
            )
          ],
        ),
      ),
    );
  }

  final qrdataFeed = TextEditingController();
}
