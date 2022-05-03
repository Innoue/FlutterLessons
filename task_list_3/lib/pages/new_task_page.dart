import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  NewTask({Key? key}) : super(key: key);

  TextEditingController _titleTask = TextEditingController();
  TextEditingController _descTask = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Título',
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
                maxLines: 5,
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
                  onPressed: () {
                    String title = _titleTask.text.toString();
                    String desc = _descTask.text.toString();
                    print("Title = $title \n Description = $desc");
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
