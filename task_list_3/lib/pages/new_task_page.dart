import 'package:flutter/material.dart';
import 'package:task_list_3/data/task.dart';

class NewTaskPage extends StatefulWidget {
  NewTaskPage({Key? key}) : super(key: key);

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  TextEditingController _titleTask = TextEditingController();
  TextEditingController _descTask = TextEditingController();

  String? _titleError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Tarefa"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Título',
                  errorText: _titleError,
                  border: OutlineInputBorder(),
                ),
                controller: _titleTask,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Descrição da tarefa',
                  border: OutlineInputBorder(),
                ),
                controller: _descTask,
                maxLines: 4,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  child: Text("Criar"),
                  onPressed: () => _createTask(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createTask(BuildContext context) {
    String title = _titleTask.text.toString();
    String desc = _descTask.text.toString();

    if (title.isEmpty){
      setState(() {
        _titleError = 'Preencha o título';
      });
    }else{
      final task = Task(title: title, description: desc);
      _titleError = null;
      Navigator.pop(context, task);
    }
  }
}
