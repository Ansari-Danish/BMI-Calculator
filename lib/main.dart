import 'package:bankurl/bmi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'BMI Calculator',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.amber 
      ),

      home:const BmiSecreen() ,
      
      
    );
  }
}