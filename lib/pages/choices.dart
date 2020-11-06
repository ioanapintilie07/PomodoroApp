import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Choices extends StatefulWidget {
  @override
  _ChoicesState createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
  int pomodoros = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pomodoro App'),
        centerTitle: true,
        backgroundColor: Colors.green[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 15.0),
            child: Center(
              child: Text("I want to work for: ",
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 2.0,
                ),
              ),
            )
          ),
          Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.green[200],
                border: Border.all()),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: pomodoros,
                items : [
                  DropdownMenuItem(child: Text("1"), value: 1,),
                  DropdownMenuItem(child: Text("2"), value: 2,),
                  DropdownMenuItem(child: Text("3"), value: 3,),
                  DropdownMenuItem(child: Text("4"), value: 4,),
                  DropdownMenuItem(child: Text("5"), value: 5,),
                  DropdownMenuItem(child: Text("6"), value: 6,),
                  DropdownMenuItem(child: Text("7"), value: 7),
                  DropdownMenuItem(child: Text("8"), value: 8),
                  DropdownMenuItem(child: Text("9"), value: 9),
                  DropdownMenuItem(child: Text("10"), value: 10),
                  DropdownMenuItem(child: Text("11"), value: 11),
                  DropdownMenuItem(child: Text("12"), value: 12),
                  DropdownMenuItem(child: Text("13"), value: 13),
                  DropdownMenuItem(child: Text("14"), value: 14),
                  DropdownMenuItem(child: Text("15"), value: 15),
                  DropdownMenuItem(child: Text("Work until death"), value: 100),
                ],
                onChanged: (value){
                  setState(() {
                    pomodoros = value;
                  });
                }
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: Text("pomodoro(s) ",
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
          ),
          FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pomodoro', arguments: {'hours' : pomodoros});
              },
              color: Colors.green[200],
              child: Text("Let's go",
                  style: TextStyle(
                    fontSize: 22.0,
                    letterSpacing: 2.0,
                  )
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(100.0),
              )
          )
        ],
      )
    );
  }
}
