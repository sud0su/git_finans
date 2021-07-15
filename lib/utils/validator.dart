class Validation {
  String? email(String? value) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = new RegExp(pattern.toString());
    if (value == '') {
      return "Email cannot be empty";
    } else if (!regex.hasMatch(value!)) return "Wrong Email";
  }

  String? required(String? value) {
    if (value == '') {
      return "This field cannot be empty";
    }
  }

  String? validatePassword(String? value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{9,}$';
    RegExp regExp = new RegExp(pattern);
    if (value == '') {
      return "Password cannot be empty";
    } else if (!regExp.hasMatch(value!)) return "Wrong Password";
  }

  String? phoneNumber(String? value) {
    if (value == '') {
      return "Phonenumber cannot be empty";
    } else if (value!.substring(0, 2) != '08')
      return "Phonenumber must be started with 08";
  }
}
