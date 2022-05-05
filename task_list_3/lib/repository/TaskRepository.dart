import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/task.dart';

late final SharedPreferences shared;

const listTaskKey = 'taskList';

class TaskRepository{
  
  Future<List<Task>> getTasks() async{
    shared = await SharedPreferences.getInstance();
    final listTaskString = shared.getString(listTaskKey);
    List listJson = jsonDecode(listTaskString ?? '[]');
    //print(listTaskString);
    return listJson.map((e) => Task.fromJson(e)).toList();
  }

  void saveTasks(List<Task> taskList){
    String jsonListTask = jsonEncode(taskList);
    //print(jsonListTask);
    shared.setString(listTaskKey, jsonListTask);
  }
}