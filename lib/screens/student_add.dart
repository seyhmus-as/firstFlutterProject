import 'package:basic_widget/models/student.dart';
import 'package:basic_widget/models/student.dart';
import 'package:basic_widget/models/student.dart';
import 'package:basic_widget/validation/student_validator.dart';
import 'package:flutter/material.dart';


class StudentAdd extends StatefulWidget {
  List<Student>? students;
  StudentAdd(List<Student> students){
    this.students=students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students!);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  List<Student>? students;
  var student = Student.withId(0, "", "", 0);
  var formKey = GlobalKey<FormState>();

  _StudentAddState(List<Student> students){
    this.students=students;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Add a student"),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 0, 20),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton(),
              ],
            ),
          ),
        ));
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "First Name", hintText: "Mehmet"),
      validator: validateFirstName,
      onSaved: (String? string) {
        student.firstName = string!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Last Name", hintText: "Yılmaz"),
      validator: validateLastName,
      onSaved: (String? value) {
        student.lastName = value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      validator: validateGradeName,
      decoration: InputDecoration(labelText: "Grade", hintText: "100"),
      onSaved: (String? value) {
        student.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
        child: Text("Kaydet"),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            students!.add(student);
            Navigator.pop(context);
          }
        });
  }
}
