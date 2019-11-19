//import 'package:fios/models/referee.dart';
//import 'package:fios/models/user.dart';
import 'package:fios/models/referee.dart';
import 'package:flutter/foundation.dart';

class Referral {
  String id;
  String name;
  String lastName;
  String address;
  String apt;
  String city;
  int zipcode;
  String phone;
  String email;
  String status;
  String comment;
  String moveIn;
  String dueDate;
  String orderDate;
  String package;
  String mon;
  Referee referredBy;
  //Manager manager;
  String userId;
  bool emailSent;
  //User updatedBy;
  String updated;
  bool collateralSent;
  String collateralSentOn;

  Referral({
    @required this.id,
    @required this.name,
    @required this.lastName,
    @required this.address,
    this.apt,
    @required this.city,
    @required this.zipcode,
    @required this.phone,
    this.email,
    this.emailSent,
    this.userId,
    this.collateralSent,
    this.collateralSentOn,
    this.comment,
    this.dueDate,
    // @required this.manager,
    this.mon,
    @required this.moveIn,
    this.orderDate,
    this.package,
    //this.referredBy,
    @required this.status,
    this.updated,
    //this.updatedBy
  });

  factory Referral.fromJson(Map<String, dynamic> json) {
    return Referral(
      id: json['_id'],
      name: json['name'],
      lastName: json['last_name'],
      email: json['email'],
      address: json['address'],
      apt: json['apt'],
      city: json['city'],
      zipcode: json['zipcode'] as int,
      phone: json['phone'],
      package: json['package'],
      moveIn: json['moveIn'],
      mon: json['mon'],
      collateralSentOn: json['collateral_sent_on'],
      collateralSent: json['collateral_sent'],
      status: json['status'],
      comment: json['comment'],
      emailSent: json['email_sent'],
      dueDate: json['due_date'],
      orderDate: json['order_date'],
      //manager: Manager.fromJson(json['manager']),
      //referredBy: Referee.fromJson(json['referralBy']),
      updated: json['update'],
      userId: json['userId'],
      //updatedBy: User.fromJson(json['updatedBy']),
    );
  }
}
