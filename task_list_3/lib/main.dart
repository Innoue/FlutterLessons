import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _task = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas do dia'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          showDialog(
            context: context, 
            builder: (BuildContext build){
              return AlertDialog(
                title: Text("Adicionar Tarefa"),
                content: Text("Conteúdo do Dialog"),
                actions: [
                  TextField(
                    controller: _task,
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    }, 
                    child: Text("Cancelar")
                  ),
                  TextButton(
                    onPressed: (){
                      print(_task.text);
                      Navigator.of(context).pop();
                    },
                    child: Text("OK")
                  ),
                ],

              );
            }
          );
        },
      ),
    );
  }
}
