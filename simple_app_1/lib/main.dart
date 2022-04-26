import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.amber,
        home: Scaffold(
          body: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Teste"),
              Icon(Icons.alarm),
              Text("Teste"),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                        onPressed: () {
                          print("Clique");
                        },
                        child: Text("Clique aqui")),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print("Clique");
                      },
                      child: Text("Clique aqui"))
                ],
              )
            ],
          )),
        ));
  }
}
