import 'package:brightpath/data/data.dart';
import 'package:brightpath/pages/VideoPlayerScreen.dart';
import 'package:flutter/material.dart';


class MyCoursesScreen extends StatefulWidget {
  @override
  _MyCoursesScreenState createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  String _currentFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('My Courses'),
        
        
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFilterChips(),
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) => _buildCourseCard(courses[index]),
            ),
          ),
        ],
      ),
      
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: ['All', 'Downloaded', 'Archived', 'Favorited'].map((filter) {
          return Padding(
            padding: EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(filter),
              selected: _currentFilter == filter,
              onSelected: (selected) {
                setState(() {
                  _currentFilter = filter;
                });
              },
              backgroundColor: Colors.grey[800],
              selectedColor: Colors.white,
              labelStyle: TextStyle(
                color: _currentFilter == filter ? Colors.black : Colors.white,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCourseCard(Course course) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.grey[900],
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            "https://wallpaperaccess.com/full/1426962.jpg", // Replace with actual image URL
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          course.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(course.name, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 4),
            LinearProgressIndicator(
              value: 0.3, // Replace with actual progress
              backgroundColor: Colors.grey[700],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 4),
            Text('30% complete', style: TextStyle(color: Colors.blue)),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VideoPlayerScreen()),
          );
        },
      ),
    );
  }
}