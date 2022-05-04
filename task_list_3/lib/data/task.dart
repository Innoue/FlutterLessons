class Task {
  Task({required this.title, this.description = ''});

  String title;
  String description; 

  Task.fromJson(Map json): title = json['title'], description = json['description'];

  Map toJson() => {
    'title' : title,
    'description' : description, 
  };

}