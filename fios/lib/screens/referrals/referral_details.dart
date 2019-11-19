import 'package:fios/models/referral.dart';
import 'package:fios/screens/home_screen.dart';
import 'package:fios/screens/referrals/edit_referral.dart';
import 'package:fios/utils/date_format.dart';
import 'package:flutter/material.dart';

class ReferralDetail extends StatefulWidget {
  static final routeName = 'referral_detail';
  final Referral referral;
  ReferralDetail(this.referral);
  @override
  _ReferralDetailState createState() => _ReferralDetailState();
}

class _ReferralDetailState extends State<ReferralDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width - 80.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0))),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0)),
              child: Image.asset(
                'assets/images/nyc.jpg',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.width,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        widget.referral.name.toUpperCase(),
                        style: TextStyle(
                            fontSize: 26.0,
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        widget.referral.lastName.toUpperCase(),
                        style: TextStyle(
                            fontSize: 26.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          size: 28,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditReferralScreen(widget.referral)));
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    widget.referral.phone,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0),
                  )
                ],
              ),
            ),
            Positioned(
              top: 60,
              right: 40,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      HomeScreen.routeName, (Route<dynamic> route) => false);
                },
                child: Material(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.black12,
                  elevation: 10.0,
                  child: Icon(
                    Icons.close,
                    size: 24.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          height: 2.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Address',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    widget.referral.address.toUpperCase(),
                    style: TextStyle(fontSize: 22.0),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.referral.apt.toUpperCase(),
                    style: TextStyle(fontSize: 22.0),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    widget.referral.city.toUpperCase(),
                    style: TextStyle(fontSize: 22.0),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.referral.zipcode.toString(),
                    style: TextStyle(fontSize: 22.0),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Contact Info',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.referral.phone,
                    style: TextStyle(fontSize: 22.0),
                  ),
                  Text(
                    widget.referral.email,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Additional Info',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Moving Date: ${FormatDate.format(widget.referral.moveIn)}',
                style: TextStyle(fontSize: 22.0),
              ),
              Text(
                widget.referral.collateralSent
                    ? 'Collaterral Sent: ${FormatDate.format(widget.referral.collateralSentOn)}'
                    : 'No',
                style: TextStyle(fontSize: 22.0),
              ),
              Text(
                'Status: ${widget.referral.status.toUpperCase()}',
                style: TextStyle(fontSize: 22.0),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Comments or Notes',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22.0),
                    ),
                    Text(widget.referral.comment),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
