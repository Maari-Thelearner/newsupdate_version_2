import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:newsupdate/drawercontent/api_service.dart';

class Pdfview extends StatefulWidget {
  @override
  _PdfviewState createState() => _PdfviewState();
}

class _PdfviewState extends State<Pdfview> {
  String _localfile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Apiservice.LoadPdf().then((value){
      setState(() {
        _localfile = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text('App Info',style: TextStyle(color: Colors.blue),),
        centerTitle: true,
      ),
      body: _localfile!=null ? Container(
        child: PDFView(
          filePath: _localfile,
        ),
      ) : Center(child: CircularProgressIndicator(
        semanticsLabel: 'Loading....',
        semanticsValue: 'Please Wait.. Loading..',
      )),
    );
  }
}
