import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
class Apiservice{
  static final String PDF_URL = "http://newsupdate.freevar.com/newsupdate/NewsUpdate.pdf";
  static Future<String> LoadPdf() async{
    var response = await http.get(PDF_URL);
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path+"/NewsUpdate.pdf");
   await file.writeAsBytes(response.bodyBytes , flush: true);
   return file.path;
  }
}