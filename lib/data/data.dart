class Course {
  String name;
  int id;
  double price;
  String description;
  String imagePath;
  Course(this.name, this.id, this.price, this.description , this.imagePath);
}

List<Course> courses = [
  Course("Web Development", 1, 10.0, "10 Courses", "https://th.bing.com/th/id/OIP.xi_VY54V535hztHz11VTyQHaFL?rs=1&pid=ImgDetMain"),
  Course("Artificial Intelligence", 2, 20.0, "20 Courses", "https://photutorial.com/wp-content/uploads/2023/04/Featured-image-AI-image-generators-by-Midjourney.png"),
  Course("Machine Learning", 3, 30.0, "30 Courses", "https://th.bing.com/th/id/OIP.EZeP9vSGOADD1MSdiDctcgHaE7?rs=1&pid=ImgDetMain"),
  Course("Data Science", 4, 40.0, "40 Courses", "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20200214165928/Web-Development-Course-Thumbnail.jpg"),
  Course("Cyber Security", 5, 50.0, "50 Courses", "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20200214165928/Web-Development-Course-Thumbnail.jpg"),
  Course("Cloud Computing", 6, 60.0, "60 Courses", "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20200214165928/Web-Development-Course-Thumbnail.jpg"),
  Course("Blockchain", 7, 70.0, "70 Courses", "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20200214165928/Web-Development-Course-Thumbnail.jpg"),
  Course("DevOps", 8, 80.0, "80 Courses", "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20200214165928/Web-Development-Course-Thumbnail.jpg"),
  Course("Internet of Things (IoT)", 9, 90.0, "90 Courses", "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20200214165928/Web-Development-Course-Thumbnail.jpg"),
  Course("Big Data", 10, 100.0, "100 Courses", "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20200214165928/Web-Development-Course-Thumbnail.jpg"),
];

class skillDevelopmentCourse {
  late String name;
  late int id;
  late double price;
  late String description;

  skillDevelopmentCourse(this.name, this.id, this.price, this.description);
}

List<skillDevelopmentCourse> skillDevelopmentCourses = [
  skillDevelopmentCourse("Communication Skills", 11, 50.0, "Improve your communication skills"),
  skillDevelopmentCourse("Leadership Skills", 12, 60.0, "Develop your leadership abilities"),
  skillDevelopmentCourse("Time Management", 13, 70.0, "Learn effective time management techniques"),
  skillDevelopmentCourse("Problem Solving", 14, 80.0, "Enhance your problem-solving skills"),
];