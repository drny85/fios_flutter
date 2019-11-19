import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  static final routeName = 'notes';
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
            child: Text('Notes'),
          ),
        ],
      ),
    );
  }
}
