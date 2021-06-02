import 'package:basic_widget/screens/student_add.dart';
import 'package:basic_widget/screens/student_edit.dart';
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

  Student selectedStudent = new Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1, "mehmet", "cevdet", 40),
    Student.withId(2, "ali", "cevdet", 65),
    Student.withId(3, "serhat", "cevdet", 50),
    Student.withId(4, "ibrahim", "cevdet", 25),
    Student.withId(5, "koli", "cevdet", 55),
    Student.withId(6, "servet", "cevdet", 78),
    Student.withId(7, "mehmet", "cevdet", 10),
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
                          selectedStudent = students[index];
                        });
                      } //(context,students[index]),
                      );
                })),
        Text("Selected student : " + selectedStudent.firstName),
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
                  Navigator.push(context,MaterialPageRoute(builder: (context) => StudentAdd(students)));
                },
                style: ElevatedButton.styleFrom(primary: Colors.green,
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
                  Navigator.push(context,MaterialPageRoute(builder: (context) => StudentEdit(selectedStudent)));
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
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  showMessage(context, selectedStudent.firstName + " deleted");
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
    var alert = AlertDialog(title: Text("process"), content: Text(message));
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
