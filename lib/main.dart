import 'package:flutter/material.dart';
import 'models/student.dart';

void main() {
  runApp(MaterialApp(home: StudentManagerApp()));
}

class StudentManagerApp extends StatefulWidget {
  @override
  _StudentManagerAppState createState() => _StudentManagerAppState();
}

class _StudentManagerAppState extends State<StudentManagerApp> {
  String appTopMessage = "App Name is here";

  String selectedStudent = "Abc";

  List<Student> students = [
    Student("mehmet", "cevdet", 40),
    Student("ali", "cevdet", 65),
    Student("serhat", "cevdet", 80),
    Student("ibrahim", "cevdet", 25),
    Student("koli", "cevdet", 55),
    Student("servet", "cevdet", 78),
    Student("mehmet", "cevdet", 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appTopMessage),
        ),
        body: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://yt3.ggpht.com/ytc/AAUvwngwJNZN3WObqCSP3MlLYGiR3cGFXbOkO3vWScSp2A=s900-c-k-c0x00ffffff-no-rj"),
                      ),
                      title: Text(students[index].firstName +
                          " " +
                          students[index].lastName),
                      subtitle: Text("score : " + students[index].getGrade),
                      trailing: buildStatusIcon(students[index].grade),
                      onTap: () {
                        setState(() {
                          selectedStudent = students[index].firstName;
                        });
                      } //(context,students[index]),
                      );
                })),
        Text("Selected student : " + selectedStudent),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5.0),
                    Text("Add"),
                  ],
                ),
                onPressed: () {
                  var message = "button boş şuan";
                  showMessage(context, message);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Update"),
                  ],
                ),
                onPressed: () {
                  var message = "button boş şuan";
                  showMessage(context, message);
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5.0),
                    Text("delete"),
                  ],
                ),
                onPressed: () {
                  var message = "button boş şuan";
                  showMessage(context, message);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 70) {
      return Icon(Icons.done);
    } else if (grade < 70 && grade > 50) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }

  void showMessage(BuildContext context, String message) {
    var alert =
        AlertDialog(title: Text("Result of Exam"), content: Text(message));
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
