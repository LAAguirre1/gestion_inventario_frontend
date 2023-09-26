import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String username = '';
  String password = '';

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }
}
