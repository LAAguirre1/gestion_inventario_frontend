import 'package:flutter/material.dart';

class CustomImputs {
  static InputDecoration loginImputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10),
      ),
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon),
    );
  }

  static InputDecoration searchInputDecoration({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.grey),
      labelStyle: const TextStyle(color: Colors.grey),
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }
}
