import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: Calculadora()
        )
      )
    );
  }
}

class Calculadora extends StatefulWidget{
  _CalculadoraState createState(){
    return _CalculadoraState();
  }
}

class _CalculadoraState extends State<Calculadora>{
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  int? result;

  Widget build(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: _controller1,
            keyboardType: TextInputType.number,
          ),
        ),
        ElevatedButton(
          onPressed: (){
            setState((){
              result = int.parse(_controller1.text) + int.parse(_controller2.text);
            });
          }, 
          child: Text("+")
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: _controller2,
            keyboardType: TextInputType.number,
          ),
        ),
        Text("Resultado: ${result ?? ''}")
        
      ],
    );
  }


}