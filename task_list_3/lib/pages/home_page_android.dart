import 'dart:convert';

import 'package:flutter/material.dart';
import '../pages/new_task_page.dart';
import '../data/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _task = TextEditingController();

  List<Task> listItems = [];
  bool isDone = false;

  late final SharedPreferences shared;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value){
      shared = value;
      
      final listTaskString = shared.getString('taskList');
      List listJson = jsonDecode(listTaskString ?? '[]');
      final listTask = listJson.map((e) => Task.fromJson(e)).toList();

      setState(() {
        listItems.addAll(listTask);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Tarefas do dia')),
      ),
      body: ListView.separated(
        itemCount: listItems.length,
        itemBuilder: (BuildContext context, int position) {
          final task = listItems[position];
          return ListItens(title: task.title, description: task.description,isDone: task.isDone, onChangedValue: (){
            listItems[position].isDone = !listItems[position].isDone;
            String jsonListTask = jsonEncode(listItems);
            shared.setString('taskList', jsonListTask);
          },);
        },
        separatorBuilder: (BuildContext context, int position) => Divider(
          color: Colors.grey.shade600,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future<Task?> future = Navigator.push(context, MaterialPageRoute(builder: (context) => NewTaskPage()));
          future.then((task) {
            if(task != null){
              setState(() {
                listItems.add(task);
                String jsonListTask = jsonEncode(listItems);
                shared.setString('taskList', jsonListTask);
              });
            }
          });
        },
      ),
    );
  }
}

class ListItens extends StatefulWidget {
  ListItens(
      {Key? key,
      required this.title,
      this.description = '',
      this.isDone = false,
      required this.onChangedValue})
      : super(key: key);

  String title;
  String description;
  bool isDone;
  VoidCallback onChangedValue;

  @override
  State<ListItens> createState() => _ListItens();
}

class _ListItens extends State<ListItens> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title, style: Theme.of(context).textTheme.headline3,),
      subtitle: Text(widget.description, style: Theme.of(context).textTheme.headline4,),
      trailing: widget.isDone ? Icon(Icons.done) : null,
      // leading: widget.isDone ? Icon(Icons.done) : null,
      onTap: () {
        setState(() {
          widget.isDone = !widget.isDone;
          widget.onChangedValue();
        });
      },
    );
  }
}

//Show dialog descontinuado
// showDialog(
//   context: context,
//   builder: (BuildContext build) {
//     return AlertDialog(
//       title: Text("Adicionar Tarefa"),
//       // content: Text("Informe a nova tarefa"),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//           child: TextField(
//             controller: _task,
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             TextButton(
//               style: TextButton.styleFrom(
//                 textStyle: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.red.shade100,
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("Cancelar"),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   listItems.add(ListItens(title: _task.text));
//                   _task.text = "";
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text("OK"),
//             ),
//           ],
//         ),
//       ],
//     );
//   },
// );