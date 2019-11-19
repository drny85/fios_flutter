import 'package:fios/models/referral.dart';

import 'package:fios/screens/referrals/referral_details.dart';

import 'package:fios/utils/date_format.dart';
import 'package:flutter/material.dart';

class ReferralCard extends StatelessWidget {
  final Referral referral;
  ReferralCard(this.referral);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ReferralDetail(referral)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Container(
          height: 320,
          width: 275,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      referral.name.toUpperCase(),
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      referral.lastName.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.0,
                ),
                Row(
                  children: <Widget>[
                    Text('${referral.address},'.toUpperCase()),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(referral.city.toUpperCase()),
                  ],
                ),
                SizedBox(
                  height: 18.0,
                ),
                Row(
                  children: <Widget>[
                    Text('Moving Date:'),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(FormatDate.format(referral.moveIn)),
                  ],
                ),
                SizedBox(
                  height: 18.0,
                ),
                Row(
                  children: <Widget>[
                    Text('Phone:'),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(referral.phone),
                  ],
                ),
                SizedBox(
                  height: 18.0,
                ),
                Row(
                  children: <Widget>[
                    Text('Email:'),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(referral.email),
                  ],
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(3.0, 6.0),
                    blurRadius: 3.0,
                    spreadRadius: 2.0),
              ],
              color: referral.collateralSent
                  ? Colors.grey[100]
                  : Colors.grey[350]),
        ),
      ),
    );
  }
}
