import 'package:brightpath/pages/HomeScreen.dart';
import 'package:brightpath/pages/MyCourseScreen.dart';
import 'package:brightpath/pages/ProfilePage.dart';
import 'package:brightpath/pages/QuizScreen.dart';
import 'package:brightpath/pages/SearchPage.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  
  final List<Widget> _pages = [
    Homescreen(), 
    SearchPage(), 
    QuizPage(courseTitle: 'Python'),
    MyCoursesScreen(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.quiz, size: 30),
          Icon(Icons.menu_book_rounded, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.orange,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
        
              body: _pages[_page], 
       
    );
    
  }
}