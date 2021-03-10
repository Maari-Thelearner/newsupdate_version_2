import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:newsupdate/home.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Webview extends StatefulWidget {
  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  final Completer<WebViewController> _completer= Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('news data',style: TextStyle(color: Colors.black),),
        centerTitle: true,
       /* actions: [
          Builder(
            builder:(context) => IconButton(icon: Icon(Icons.copy,color: Colors.black  ,),
              onPressed: () async{
                await FlutterClipboard.copy('This Url Link is from \'NewsUpdate App\' \n'
                    ' To Download this App\n'
                    '  Click the below Link and Download the app \n'
                    '  http://newsupdate.freevar.com/newsupdate/app.apk \n'
                    'You can download this on AmazonAppstore as well\n'
                    '   Here is the news link!! \n'
                    '${url.toString()}');
                Scaffold.of(context).showSnackBar(SnackBar(content: Text('Link is Copied'),));
              },
            ),
          ),
        ],*/
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: ((WebViewController webViewController){
          setState(() {
            _completer.complete(webViewController);
          });
        }),
      ),
    );
  }
}
