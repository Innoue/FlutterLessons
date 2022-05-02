import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
          showDialog(
            context: context,
            builder: (BuildContext build) {
              return AlertDialog(
                title: Text("Adicionar Tarefa"),
                // content: Text("Informe a nova tarefa"),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      controller: _task,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade100,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancelar"),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            listItems.add(ListItens(title: _task.text));
                            _task.text = "";
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("OK"),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class ListItens extends StatefulWidget {
  ListItens({Key? key, required this.title, this.isDone = false})
      : super(key: key);

  String title;
  bool isDone;

  @override
  State<ListItens> createState() => _ListItens();
}

class _ListItens extends State<ListItens> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
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
