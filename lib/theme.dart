
import 'package:flutter/material.dart';


class ThemeProvider extends ChangeNotifier{
  ThemeData _selectedTheme;
  ThemeData light = ThemeData.light().copyWith(
    primaryColor: Colors.white,
    accentColor: Colors.black,
  );
 ThemeData dark = ThemeData.dark().copyWith(
   primaryColor: Colors.black,
   accentColor: Colors.white,
 );
 ThemeProvider({bool isDarkMode}){
   _selectedTheme = isDarkMode ? dark : light;
 }
  void swapTheme(){
   if (_selectedTheme == dark) {
     _selectedTheme = light;

   } else {
     _selectedTheme = dark;
   }
   notifyListeners();
  }
 ThemeData get getTheme => _selectedTheme;


}