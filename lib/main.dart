import 'package:brightpath/pages/CoursePage.dart';
import 'package:brightpath/pages/HomeScreen.dart';
import 'package:brightpath/common/BottomNavigationBar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
              home:  Scaffold(
          body: BottomNavBar(                                                               
          )
      ),
    );
  }
}
