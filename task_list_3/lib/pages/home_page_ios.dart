import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _task = TextEditingController();
  List<Widget> listItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Tarefas do dia"),
          trailing: CupertinoButton(
            child: Icon(CupertinoIcons.add),
            padding: EdgeInsets.zero,
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title: Text("Nova tarefa"),
                  content: Card(
                    child: Column(
                      children: [
                        CupertinoTextField(
                          placeholder: "Título da tarefa",
                          controller: _task,
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: Text("Ok"),
                      isDefaultAction: true,
                      onPressed: () {
                        setState(() {
                          listItems.add(Item(title: _task.text));
                          _task.text = '';
                        });
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text("Cancelar"),
                      isDestructiveAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          _task.text = '';
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        child: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (context, index) => listItems[index],
        ),
      ),
    );
  }
}

class Item extends StatefulWidget {
  Item({Key? key, required this.title, this.isDone = false}) : super(key: key);

  String title;
  bool isDone;
  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        title: Text(widget.title),
        trailing: widget.isDone ? Icon(CupertinoIcons.check_mark) : null,
      ),
      onTap: () {
        setState(() {
          widget.isDone = !widget.isDone;
        });
      },
    );
  }
}
