import 'package:flutter/material.dart';

class User {
  String id;
  String name;
  String lastName;
  String email;
  String phone;
  Roles roles;

  User({
    @required this.id,
    this.name,
    this.lastName,
    this.email,
    this.phone,
    this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['_id'],
        name: json['name'],
        lastName: json['last_name'],
        email: json['email'],
        phone: json['phone'],
        roles: Roles.fromJson(json['roles']));
  }
}

class Roles {
  bool isAdmin;
  bool actice;
  bool coach;

  Roles({this.actice, this.coach, this.isAdmin});

  factory Roles.fromJson(Map<String, dynamic> json) {
    return Roles(
      actice: json['active'],
      isAdmin: json['isAdmin'],
      coach: json['coach'],
    );
  }
}
