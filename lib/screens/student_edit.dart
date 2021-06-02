import 'package:basic_widget/models/student.dart';
import 'package:basic_widget/validation/student_validator.dart';
import 'package:flutter/material.dart';


class StudentEdit extends StatefulWidget {
  Student? selectedStudent;
  StudentEdit(Student selectedStudent){
    this.selectedStudent=selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentEditState(selectedStudent!);
  }
}

class _StudentEditState extends State with StudentValidationMixin {
  Student? selectedStudent;
  var formKey = GlobalKey<FormState>();

  _StudentEditState(Student student){
    this.selectedStudent=student;
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
      initialValue: selectedStudent!.firstName,
      validator: validateFirstName,
      onSaved: (String? string) {
        selectedStudent!.firstName = string!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Last Name", hintText: "Yılmaz"),
      initialValue: selectedStudent!.lastName,
      validator: validateLastName,
      onSaved: (String? value) {
        selectedStudent!.lastName = value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      validator: validateGradeName,
      decoration: InputDecoration(labelText: "Grade", hintText: "100"),
      initialValue: selectedStudent!.grade.toString(),
      onSaved: (String? value) {
        selectedStudent!.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
        child: Text("Kaydet"),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            Navigator.pop(context);
          }
        });
  }
  void show(Student student){
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}
