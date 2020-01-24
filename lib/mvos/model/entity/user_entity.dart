import 'package:flutter/foundation.dart';

class FirebaseUserE {
  final String name;
  final String surname;
  final String email;
  final String phone;
  final String uid;
  final List courseCode;

  const FirebaseUserE(
      {this.name,
      this.surname,
      this.phone,
      this.courseCode,
      @required this.uid,
      @required this.email});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FirebaseUserE &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          surname == other.surname &&
          email == other.email &&
          phone == other.phone &&
          uid == other.uid &&
          courseCode == other.courseCode;

  @override
  int get hashCode =>
      name.hashCode ^
      surname.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      uid.hashCode ^
      courseCode.hashCode;
}
