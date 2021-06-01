class StudentValidationMixin{
  String? validateFirstName(String? value){
    if(value!.length<3){
      return "name must be bigger than 2 character";
    }
    return null;
  }

  String? validateLastName(String? value){
    if(value!.length<3){
      return "name must be bigger than 2 character";
    }
    return null;
  }

  String? validateGradeName(String? value){
    int number = int.parse(value!);
    if(number>100){
      return "score must be smaller than 100";
    }
    return null;
  }
}