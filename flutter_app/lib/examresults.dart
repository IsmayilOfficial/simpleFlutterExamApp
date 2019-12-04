import 'package:flutter/material.dart';
import 'main.dart';



class ExamResults extends StatelessWidget {
 int ScoreX=0;
  Function restart;         // reference to function to use in Button
  ExamResults(Function somefunction, int ScoreX){
    restart=somefunction;
    this.ScoreX=ScoreX;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text("$ScoreX"),
        RaisedButton(
          child: Text("Try again"),
          onPressed: restart,
        )
      ],
    );
  }
}
