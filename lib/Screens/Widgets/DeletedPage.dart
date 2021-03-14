import 'package:flutter/material.dart';



class DeletedNote extends StatefulWidget {
  @override
  _DeletedNoteState createState() => _DeletedNoteState();
}

class _DeletedNoteState extends State<DeletedNote> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Deleted Note Note'),),
    );
  }
}