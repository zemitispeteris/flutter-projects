import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellowAccent,
        appBar: AppBar(
          title: Text('Muhammad Ali'),
          backgroundColor: Colors.yellow,
        ),
        body: Center(
          child: Container(
            child: Row(),
          ),

//          child: Container(
//              Column<Widget>[
//
//          )
//
//          ]
        ),
      ),
    );
  }
}
