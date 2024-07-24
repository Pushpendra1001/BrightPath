import 'package:brightpath/data/data.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  

  List<Course> _allCourses = [];
  List<Course> _filteredCourses = [];


  @override
  void initState() {
    super.initState();
        _allCourses = courses; 
    _filteredCourses = _allCourses;
  }

   void _searchCourse(String query) {
    final suggestions = _allCourses.where((course) {
      final courseLower = course.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return courseLower.contains(queryLower);
    }).toList();

    setState(() {
      _filteredCourses = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Courses'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for a course',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: _searchCourse,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: _filteredCourses.length,
                itemBuilder: (BuildContext context, int index) {
                   final course = _filteredCourses[index];
                  return Padding(
                    padding: EdgeInsets.all(2),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  course.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Icon(Icons.bookmark_border_outlined)
                              ],
                            ),
                          ),
                          Image.network(
                            course.imagePath,
                            height: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  course.description,
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}