import 'package:flutter/material.dart';
import '../pages/new_task_page.dart';
import '../data/task.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _task = TextEditingController();

  List<Widget> listItems = [];

  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Tarefas do dia')),
      ),
      body: ListView.separated(
        itemCount: listItems.length,
        itemBuilder: (BuildContext context, int position) {
          return listItems[position];
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
                listItems.add(
                  ListItens(
                    title: task.title,
                    description: task.description,
                  ),
                );
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
      this.isDone = false})
      : super(key: key);

  String title;
  String description;
  bool isDone;

  @override
  State<ListItens> createState() => _ListItens();
}

class _ListItens extends State<ListItens> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title, style: Theme.of(context).textTheme.headline5,),
      subtitle: Text(widget.description, style: Theme.of(context).textTheme.headline6,),
      trailing: widget.isDone ? Icon(Icons.done) : null,
      // leading: widget.isDone ? Icon(Icons.done) : null,
      onTap: () {
        setState(() {
          widget.isDone = !widget.isDone;
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