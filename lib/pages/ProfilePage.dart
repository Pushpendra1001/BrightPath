import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock data for profile items
    final List<Map<String, dynamic>> profileItems = [
      {'icon': Icons.person, 'text': 'My Account'},
      {'icon': Icons.star, 'text': 'Achievements'},
      {'icon': Icons.help, 'text': 'Quiz'},
      {'icon': Icons.settings, 'text': 'Settings'},
      {'icon': Icons.info, 'text': 'About'},
      {'icon': Icons.feedback, 'text': 'Feedback'},
      {'icon': Icons.logout, 'text': 'Logout'},
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.orange.shade400,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(50),
                     topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('https://wallpaperaccess.com/full/2562964.jpg'), // Example profile picture
                    ),
                    SizedBox(height: 10),
                    Text(
                      'John Done',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: ListView.builder(
                  itemCount: profileItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(profileItems[index]['icon']),
                      title: Text(profileItems[index]['text']),
                      onTap: () {
                        // Handle item tap
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}