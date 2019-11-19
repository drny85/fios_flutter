import 'dart:collection';
import 'package:fios/models/referral.dart';
import 'package:fios/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Referrals extends ChangeNotifier {
  List<Referral> _referrals = [];
  List<Referral> _refsCopy = [];

  UnmodifiableListView<Referral> get referrals =>
      UnmodifiableListView(_referrals);

  Future<void> getReferrals() async {
    try {
      http.Response response =
          await http.get('$kUrl/referrals', headers: kHeaders);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        List<Referral> loadedReferrals = [];
        data.forEach((ref) {
          final referral = Referral.fromJson(ref);
          loadedReferrals.add(referral);
        });
        _refsCopy = loadedReferrals;
        _referrals = loadedReferrals;

        notifyListeners();

        // } else {
        //   //check for error
        //   if (response.statusCode >= 400) {
        //     //print(response.body);
        //     throw response.body;
        //   }
      }
    } catch (e) {
      print("EZRRO $e");
    }
  }

  List<Referral> refs = [];

  void searchReferral(String value) {
    print(referrals.length);
    if (value.isEmpty) {
      _referrals = _refsCopy;
    }
    _referrals = _referrals.where((ref) {
      return ref.name.toLowerCase().contains(value.toLowerCase())
          ? ref.name.toLowerCase().contains(value.toLowerCase())
          : ref.address.toLowerCase().contains(value.toLowerCase())
              ? ref.address.toLowerCase().contains(value.toLowerCase())
              : ref.apt.toLowerCase().contains(value.toLowerCase())
                  ? ref.apt.toLowerCase().contains(value.toLowerCase())
                  : ref.lastName.toLowerCase().contains(value.toLowerCase());
      //     ref.lastName.toLowerCase().contains(value.toLowerCase()) ||
      //     ref.apt.toLowerCase().contains(value.toLowerCase()) ||
      //     ref.address.toLowerCase().contains(value.toLowerCase()) ||
      //     ref.mon.toLowerCase().contains(value.toLowerCase());
    }).toList();

    notifyListeners();
  }
}
