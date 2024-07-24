import 'package:flutter/material.dart';
import 'dart:math';

class QuizPage extends StatefulWidget {
  final String courseTitle;

  QuizPage({required this.courseTitle});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _quizCompleted = false;

  List<Map<String, dynamic>> _questions = [
    {
      'question': 'Which of these is not a programming language?',
      'options': ['Python', 'Java', 'HTML', 'Banana'],
      'correctAnswer': 'Banana',
    },
    {
      'question': 'What does CSS stand for?',
      'options': ['Computer Style Sheets', 'Creative Style Sheets', 'Cascading Style Sheets', 'Colorful Style Sheets'],
      'correctAnswer': 'Cascading Style Sheets',
    },
    {
      'question': 'Which symbol is used for comments in Python?',
      'options': ['//', '/* */', '#', '<!-- -->'],
      'correctAnswer': '#',
    },
    {
      'question': 'What is the capital of France?',
      'options': ['Paris', 'London', 'Berlin', 'Madrid'],
      'correctAnswer': 'Paris',
    },
    {
      'question': 'What is the value of pi (π)?',
      'options': ['3.14', '2.71', '1.61', '4.19'],
      'correctAnswer': '3.14',
    },

  ];

  void _checkAnswer(String selectedAnswer) {
    String correctAnswer = _questions[_currentQuestionIndex]['correctAnswer'];
    bool isCorrect = selectedAnswer == correctAnswer;

    setState(() {
      if (isCorrect) _score++;

      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _quizCompleted = true;
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _quizCompleted = false;
      _questions.shuffle(); // Randomize question order
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz: ${widget.courseTitle}'),
        backgroundColor: Colors.orange,
      ),
      body: _quizCompleted ? _buildResultScreen() : _buildQuizScreen(),
    );
  }

  Widget _buildQuizScreen() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / _questions.length,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
            SizedBox(height: 20),
            Text(
              'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              _questions[_currentQuestionIndex]['question'],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ..._buildAnswerButtons(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAnswerButtons() {
    List<String> options = List<String>.from(_questions[_currentQuestionIndex]['options']);
    options.shuffle(); // Randomize option order

    return options.map((option) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ElevatedButton(
          child: Text(
            option,
            style: TextStyle(fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(color: Colors.purple),
            ),
          ),
          onPressed: () => _checkAnswer(option),
        ),
      );
    }).toList();
  }

  Widget _buildResultScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Quiz Completed!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Your Score: $_score / ${_questions.length}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Restart Quiz'),
            style: ElevatedButton.styleFrom(),
            onPressed: _restartQuiz,
          ),
        ],
      ),
    );
  }
}