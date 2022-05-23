import 'package:flutter/material.dart';
import 'olustur.dart';
import 'tara.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaDurum createState() => _AnaSayfaDurum();
}

class _AnaSayfaDurum extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 51, 102, 102),
        title: Text("Ana Ekran"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(image: AssetImage('assets/logo.png')),
            flatButton("QR CODE TARA", Tara()),
            SizedBox(
              height: 10.0,
            ),
            flatButton("QR CODE OLUŞTUR", qrOlustur()),
          ],
        ),
      ),
    );
  }

  Widget flatButton(String text, Widget widget) {
    return FlatButton(
      padding: EdgeInsets.all(15.0),
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(
        text,
        style: TextStyle(
            color: Color.fromARGB(255, 51, 102, 102),
            fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
          side:
              BorderSide(color: Color.fromARGB(255, 51, 102, 102), width: 3.0),
          borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
