import 'dart:async';

import 'package:brightpath/common/quote_popup.dart';
import 'package:brightpath/data/data.dart';
import 'package:brightpath/pages/CoursePage.dart';
import 'package:brightpath/pages/QuizScreen.dart';
import 'package:brightpath/pages/VideoPlayerScreen.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  bool showQuotes = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
    _startQuoteTimer();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      showQuotes = prefs.getBool('showQuotes') ?? true;
    });
  }

  Future<void> _toggleQuotes(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showQuotes', value);
    setState(() {
      showQuotes = value;
    });

     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(showQuotes ? 'Quotes are turned on' : 'Quotes are turned off'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _startQuoteTimer() {
    Timer.periodic(Duration(minutes: 5), (timer) {
      if (showQuotes) {
        showQuotePopup(context);
      }
    });
  }

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Bright Path' , style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
           Switch(
            value: showQuotes,
            onChanged: _toggleQuotes,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return VideoPlayerScreen();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1547992087-e67e3944257e?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Academic Courses",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Spacer(),
                  Text(
                    "See More",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: courses.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => CoursePage(courseName: courses[index].name,))),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2.5,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              courses[index].name.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Spacer(),
                                            Icon(Icons.bookmark_border_outlined)
                                          ],
                                        ),
                                      ),
                                    Image.network(
                                              courses[index].imagePath.toString(),
                                              height: 100,
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                } else {
                                                  return Center(
                                                    child: CircularProgressIndicator(
                                                      value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                            : null,
                                                    ),
                                                  );
                                                }
                                              },
                                              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                                return Center(
                                                  child: Icon(
                                                    Icons.image,
                                                    color: Colors.orange,
                                                    size: 50,
                                                  ),
                                                );
                                              },
                                            ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              courses[index]
                                                  .description
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              
              Row(
                children: [
                  Text(
                    "Skill Development",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Spacer(),
                  Text(
                    "See More",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Expanded(
                      child: ListView.builder(
                            itemCount: skillDevelopmentCourses.length,
                            itemBuilder: (context, index) {
                              final course = skillDevelopmentCourses[index];
                              return InkWell(
                                onTap: () => Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => CoursePage(courseName: course.name,))),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://th.bing.com/th/id/OIP.Kq6fmfWaEL93PYfnemYuVQHaEK?rs=1&pid=ImgDetMain"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      course.name,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      course.description,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuizPage(courseTitle: 'Python',))),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('assets/bluestar.jpg'),
                            fit: BoxFit.cover)),
                    child: Center(
                        child: Text(
                      "Quiz Section",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.white),
                    )),
                  ),
                ),
              ),
          ],
          ),
        ),
      ),
    );
  }
}
