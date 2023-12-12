class Validators {
  static String? noneEmptyValidator(String? value) {
    if (value!.isEmpty) {
      return 'This field is required';
    } else {
      return null;
    }
  }

  static String? userNameValidator(String? value) {
    Pattern mobileNumberPattern = r'^(?:[+0][1-9])?[0-9]{10}$';
    Pattern emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (RegExp(emailPattern as String).hasMatch(value!)) {
      return null;
    } else if (RegExp(mobileNumberPattern as String).hasMatch(value)) {
      return null;
    } else {
      return "Please enter a valid username";
    }
  }

  static String? passwordValidator(String? value) {
    return value!.length > 5 ? null : "Password have minimum 6 characters";
  }

  static String? confirmPasswordValidator(String value, password) {
    return password == value ? null : "Please enter the same password";
  }

  static String? pincodeValidator(String? value) {
    String pattern = r'^[1-9][0-9]{5}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value!) ? null : "Please enter a valid Pincode";
  }

  static String? mobileNumberValidator(value) {
    Pattern mobileNumberPattern = r'^[0-9]{10}$';
    if (RegExp(mobileNumberPattern as String).hasMatch(value)) {
      return null;
    } else {
      return "Enter a valid number";
    }
  }

  static String? emailValidator(String? email) {
    Pattern emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(emailPattern as String).hasMatch(email!)
        ? null
        : "Please use a valid email address";
  }

  static bool isValidEmail(String email) {
    Pattern emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(emailPattern as String).hasMatch(email);
  }

  static String? isValidMobile(String mobile) {
    dynamic mobileNumberPattern = r'^(?:[+0][1-9])?[0-9]{10}$';
    return RegExp(mobileNumberPattern).hasMatch(mobile)
        ? null
        : "Use Valid Phone number";
  }

  bool isValidPhoneNumber(String phoneNumber) {
    // Define a regular expression pattern for a valid phone number
    // This pattern allows for a variety of formats, including with or without country code and hyphens.
    final RegExp phoneRegex = RegExp(
      r'^\+?[0-9]{1,4}?[-\s]?[0-9]{3,4}[-\s]?[0-9]{3,4}$',
    );

    // Use the RegExp.hasMatch() method to check if the phone number matches the pattern
    return phoneRegex.hasMatch(phoneNumber);
  }

  String? validatePhoneNumber(String phoneNumber) {
    // Use the isValidPhoneNumber function to validate the phone number
    bool isValid = isValidPhoneNumber(phoneNumber);
    return isValid ? null : 'Invalid phone number';
  }
}

String capitalize(String input) {
  if (input.isEmpty) {
    return input;
  }
  return input[0].toUpperCase() + input.substring(1);
}
