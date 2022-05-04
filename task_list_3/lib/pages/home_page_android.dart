import 'package:flutter/material.dart';
import 'package:task_list_3/repository/TaskRepository.dart';
import '../pages/new_task_page.dart';
import '../data/task.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _task = TextEditingController();
  List<Task> listItems = [];
  TaskRepository repository = TaskRepository();

  @override
  void initState() {
    setState(() {
      super.initState();
      repository.getTasks().then((value) => listItems.addAll(value));
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
          return ListItens(task: task, onChangedValue: (){
            listItems[position].isDone = !listItems[position].isDone;
            _saveList();
          },
          onDeleteItem: () =>_deleteTask(position, task, context)
          ,);
        },
        separatorBuilder: (BuildContext context, int position) => Divider(
          color: Colors.grey.shade800,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _createTask(context),
      ),
    );
  }

  void _createTask(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewTaskPage())).then((task) {
      if(task != null){
        setState(() {
          listItems.add(task);
          _saveList();
        });
      }
    });
  }

  void _deleteTask(int position, Task task, BuildContext context) {
    setState(() {
      listItems.removeAt(position);
      _saveList();
    });
    final snackBar = SnackBar(
      content: Text('Tarefa ${task.title} excluída!'),
      action: SnackBarAction(
        label: 'Desfazer',
        onPressed: (){
          setState(() {
            listItems.insert(position, task);
            _saveList();
          });
        },
        ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _saveList() {
    repository.saveTasks(listItems);
  }
}

class ListItens extends StatefulWidget {
  ListItens(
      {Key? key,
      required this.task,
      required this.onChangedValue,
      required this.onDeleteItem,
      })
      : super(key: key);

  Task task;
  VoidCallback onChangedValue;
  VoidCallback onDeleteItem;

  @override
  State<ListItens> createState() => _ListItens();
}

class _ListItens extends State<ListItens> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: UniqueKey(),
      onDismissed: (_){
        widget.onDeleteItem();
      },
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
              child: Icon(Icons.delete, color: Colors.white,),
          ),
        ),
      ),
      child: ListTile(
        title: Text(widget.task.title, style: Theme.of(context).textTheme.headline3,),
        subtitle: Text(widget.task.description, style: Theme.of(context).textTheme.headline4,),
        trailing: widget.task.isDone ? Icon(Icons.done) : null,
        onTap: () {
          print(widget.task.isDone);
          setState(() {
            widget.task.isDone = true;
            widget.onChangedValue();
          });
        },
      ),
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