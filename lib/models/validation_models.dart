// import 'package:flutter/material.dart';

String? validatefullName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your full name';
  }

  // Username regex pattern (alphanumeric and underscores, 3-16 characters)
  final RegExp fullNameRegex = RegExp(r'^[a-zA-Z0-9_]{3,16}$');
  if (!fullNameRegex.hasMatch(value)) {
    return 'Username must be 3-16 characters long and contain only letters, numbers, and underscores';
  }

  return null;
}



String? validateemail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }

  // Basic email regex pattern
  final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email';
  }

  return null;
}

String? validatepassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  if (value.length > 20) {
    return 'Password must be less than 20 characters long';
  }
  return null;
}