import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Tara extends StatefulWidget {
  @override
  _TaraDurum createState() => _TaraDurum();
}

class _TaraDurum extends State<Tara> {
  dynamic qrCodeSonuc = "Taramak İçin butona tıklayın";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 51, 102, 102),
        title: Text("QR Kod Okuyucu"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Sonuç;",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              qrCodeSonuc,
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              onPressed: () async {
                String codeSanner =
                    await BarcodeScanner.scan(); //barkod okuyucu
                setState(() {
                  qrCodeSonuc = codeSanner;
                });
              },
              child: Text(
                "Kamerayı aç",
                style: TextStyle(
                    color: Color.fromARGB(255, 51, 102, 102),
                    fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Color.fromARGB(255, 51, 102, 102), width: 3.0),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              onPressed: () async {
                await _launchURL(qrCodeSonuc);
                setState(() {});
              },
              child: Text(
                "Linke git",
                style: TextStyle(
                    color: Color.fromARGB(255, 51, 102, 102),
                    fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Color.fromARGB(255, 51, 102, 102), width: 3.0),
                  borderRadius: BorderRadius.circular(20.0)),
            )
          ],
        ),
      ),
    );
  }
}

_launchURL(url) async {
  await launch(url);
}
