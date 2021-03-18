import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/Screens/Home.dart';
import 'package:notes/const/const.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  void addNote() {
    reference.add({
      'title': title.text,
      'description': description.text,
    }).whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Fiels Added'),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Home(),
        ),
      );
    });
  }
@override
void initState() { 
  super.initState();
  
 title = TextEditingController(text: '');
description = TextEditingController(text: '');
}
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: FaIcon(FontAwesomeIcons.fileImport),
        onPressed: () {
          addNote();
        },
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: TextFormField(
              keyboardAppearance: Brightness.dark,
              keyboardType: TextInputType.text,
              controller: title,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'Title',
                hintStyle: TextStyle(
                  color: Colors.deepPurple[900],
                  fontSize: 23,
                ),
              ),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'lato-Regular'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 1.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                )),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            width: double.infinity,
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: description,
              decoration: InputDecoration(
                hintText: 'Description',
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'lato-regular',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
