import 'package:flutter/material.dart';
import 'package:my_bag/screen/home_screen.dart';
import 'package:my_bag/util/color.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: btnColor,
            elevation: 2,
          )
        )
      ),
      home: HomeScreen(),
    );
  }
}
