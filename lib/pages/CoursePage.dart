import 'package:brightpath/pages/VideoPlayerScreen.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {


  final String courseName;

  CoursePage({required this.courseName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
       
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/ai_image.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Center(
                  child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen(),)),
                    child: Positioned.fill(
                      child: Center(
                        child: Icon(Icons.play_circle_filled, size: 64, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Text(
                    'Preview this course',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'A comprehensive guide to building, training, and deploying AI models using TensorFlow and PyTorch.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Chip(label: Text('Top Rated')),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text('4.9', style: TextStyle(fontSize: 18)),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Text('(1,234 ratings)', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Text('10,000 students', style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text('Created by John Doe and AI Experts Inc.'),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.update, size: 16),
                      SizedBox(width: 4),
                      Text('Last updated 09/2024'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.language, size: 16),
                      SizedBox(width: 4),
                      Text('English'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.closed_caption, size: 16),
                      SizedBox(width: 4),
                      Text('English, Spanish'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('₹2,499.00', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  ElevatedButton(
                    child: Text('Go to Course'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen(),));
                    },
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          child: Text('Add to cart'),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.white),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton(
                          child: Text('Add to wishlist'),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.white),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('What you\'ll learn', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  BulletPoint('Build and train AI models using TensorFlow and PyTorch.'),
                  BulletPoint('Understand the fundamentals of neural networks and deep learning.'),
                  BulletPoint('Deploy AI models to production environments.'),
                  BulletPoint('Optimize AI models for performance and scalability.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  BulletPoint(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check, size: 20),
          SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}