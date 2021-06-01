class Student {
  String firstName="";
  String lastName="";
  String status="a";
  int grade=0;

  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  String get getStatus{
    String message ="";
    if (this.grade >= 70){
      message="çok iyi";
    }else if(this.grade<70 && this.grade >=50){
      message="orta";
    }else{
      message="kötü";
    }
    return message;
  }
  String get getGrade{
    return this.grade.toString()+" points";
  }
}
