import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            decoration: InputDecoration(
              helperText: "Informe o primeiro valor",
              filled: true,
              fillColor: Colors.blue.shade50,
              prefixIcon: Icon(Icons.numbers),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none
              ),
            ),
            controller: _controller1,
            keyboardType: TextInputType.number,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                onPressed: (){
                  setState((){
                    result = int.parse(_controller1.text) + int.parse(_controller2.text);
                  });
                }, 
                child: Text("+")
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                onPressed: (){
                  setState((){
                    result = int.parse(_controller1.text) - int.parse(_controller2.text);
                  });
                }, 
                child: Text("-")
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                onPressed: (){
                  setState((){
                    result = int.parse(_controller1.text) * int.parse(_controller2.text);
                  });
                }, 
                child: Text("*")
              )
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(
              helperText: "Informe o segundo valor",
              filled: true,
              fillColor: Colors.blue.shade50,
              prefixIcon: Icon(Icons.numbers),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none
              ),
            ),
            controller: _controller2,
            keyboardType: TextInputType.number,
          ),
        ),
        Text.rich(
          TextSpan(
            text: "Resultado: ",
            style: GoogleFonts.aladin(
              fontSize: 26
            ),
            children: [
              TextSpan(
                text: "${result ?? ''}",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                )
              )
            ]

          )
        ),
        
      ],
    );
  }


}