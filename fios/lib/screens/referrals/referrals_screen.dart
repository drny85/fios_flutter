import 'package:fios/models/referral.dart';

import 'package:fios/providers/auth.dart';
import 'package:fios/providers/referrals.dart';
//import 'package:fios/widgets/referral_card.dart';
import 'package:fios/widgets/referrals_cart_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReferralsScreen extends StatefulWidget {
  static final routeName = 'referrals_screen';
  @override
  _ReferralsScreenState createState() => _ReferralsScreenState();
}

class _ReferralsScreenState extends State<ReferralsScreen> {
  final List<String> status = [
    'new',
    'pending',
    'closed',
    'in progress',
    'not sold'
  ];
  final List<String> localStatus = [
    'New',
    'Pending',
    'Closed',
    'In Progress',
    'Not Sold'
  ];

  List<Referral> referrals = [];

  Future<void> _refreshReferrals(BuildContext context) async {
    print("refreshin");
    await Provider.of<Referrals>(context, listen: false).getReferrals();
  }

  Future<void> _getReferrals() async {
    await Provider.of<Referrals>(context, listen: false).getReferrals();
  }

  @override
  void initState() {
    super.initState();
    _getReferrals();
  }

  @override
  Widget build(BuildContext context) {
    final referrals = Provider.of<Referrals>(context).referrals;
    final user = Provider.of<Auth>(context).user;
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _refreshReferrals(context),
          backgroundColor: Theme.of(context).primaryColor,
          color: Theme.of(context).accentColor,
          child: Column(
            children: <Widget>[
              Material(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Welcome ${user.name.toUpperCase()}',
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(width: 1.0, color: Colors.grey),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search)),
                  onChanged: (value) {
                    Provider.of<Referrals>(context).searchReferral(value);
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    for (var i = 0; i < status.length; i++)
                      ReferralsCardListView(
                        referrals: referrals.where((ref) {
                          final st = status[i];
                          return ref.status == st;
                        }).toList(),
                        referralStatus: localStatus[i],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
