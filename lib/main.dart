import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  var students = ["mehmet", "cevdet", "karpuz", "kavun"];
  String myMessage = "App Name is here";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myMessage),
      ),g
      body: buildBody(context)
    );
  }

  String calculateScore(int score) {
    String scoreMessage = "";
    if (score > 50) {
      scoreMessage = "50 den fazla score almış helal";
    } else {
      scoreMessage = "50 den az almış tüh";
    }
    return scoreMessage;
  }

  void showMessage(BuildContext context, String message) {
    var alert =
        AlertDialog(title: Text("Result of Exam"), content: Text(message));
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(students[index]);
                })),
        Center(
          child: RaisedButton(
            child: Text(myMessage),
            onPressed: () {
              var message = calculateScore(40);
              showMessage(context, message);
            },
          ),
        ),
      ],
    );
  }
}
