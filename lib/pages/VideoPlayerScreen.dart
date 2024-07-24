import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';



class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer() {
    _videoPlayerController = VideoPlayerController.asset(
      'assets/Video.mp4',
    );
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Player')),
      body: Column(
        children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          child:    _chewieController != null
              ? Chewie(controller: _chewieController! , )
              : CircularProgressIndicator(),
        ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Complete Machine Learning,NLP Bootcamp MLOPS & Deployment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                CourseSection(
                  title: 'Section 1 - Getting Started',
                  videos: [
                    'Welcome To The Course',
                    'Complete Materials',
                    'Anaconda Installation',
                    'Getting Started With VS Code',
                  ],
                ),
                CourseSection(
                  title: 'Section 2 - Python Programming Language',
                  videos: [
                    'Getting Started With VS Code',
                    'Different Ways of Creating Virtual Environment',
                    'Python Basics-Syntax And Semantics',
                    'Variables In Python',
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseSection extends StatefulWidget {
  final String title;
  final List<String> videos;

  CourseSection({required this.title, required this.videos});

  @override
  _CourseSectionState createState() => _CourseSectionState();
}

class _CourseSectionState extends State<CourseSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(widget.title),
            trailing: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
          if (_isExpanded)
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.videos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.play_circle_outline),
                  title: Text(widget.videos[index]),
                  onTap: () {
                    // Handle video selection
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}