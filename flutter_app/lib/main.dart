import 'package:flutter/material.dart';
import 'examresults.dart';

void main() => runApp(MyApp());


class MyAppState extends State{
  var questions = [
    {
      "text": "Which process virtual machine does modern Android use?",
      "answers": [
        {"text": "Dalvik", "score": 1},
        {"text": "ART", "score": 3},
        {"text": "LLVM", "score": 0}
      ]
    },
    {
      "text": "What does Android use for build management?",
      "answers": [
        {"text": "Gradle", "score": 3},
        {"text": "Maven", "score": 0},
        {"text": "ANT", "score": 0}
      ]
    },
    {
      "text": "Which of these is not an Android App Component?",
      "answers": [
        {"text": "Service", "score": 0},
        {"text": "Intent", "score": 3},
        {"text": "Activity", "score": 0}
      ]
    },
  ];
  var questionIndex = 0;
  var totalScore=0;

  void answerPressed(int value){
    setState(() {
       totalScore+=value;
      questionIndex++;

    });



    print("index is : $questionIndex");
  }

  void restartExam() {
    setState(() {
      questionIndex = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("mirtaApp"),
          ),
          body: (questionIndex < questions.length) ?
          Center(
            child: Column(
              children: <Widget>[
                Text(questions[questionIndex]["text"]),
                ...(questions[questionIndex]["answers"] as List<Map<String,Object>>)
                    .map( (answer){

                  return RaisedButton(
                    child: Text(answer["text"]),
                    onPressed: ()=>answerPressed(answer["score"]),
                  );
                }
                ),

              ],
            ),
          ):ExamResults(restartExam,totalScore)
      ),
    );
  }

}
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }


}
