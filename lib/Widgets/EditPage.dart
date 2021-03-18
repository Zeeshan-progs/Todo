import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:notes/Screens/Home.dart';
import 'package:notes/const/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class EditPage extends StatefulWidget {
  DocumentSnapshot editPage;
  EditPage({this.editPage});
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  Future updateData() async {
    reference.doc().update({
      'title': title.text,
      'description': description.text
    }).whenComplete(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Content Updated'),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    title = TextEditingController(text: widget.editPage.data()['title']);
    description =
        TextEditingController(text: widget.editPage.data()['description']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: FaIcon(FontAwesomeIcons.fileExport),
        onPressed: () {
          updateData();
        },
      ),
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: ListView(
          children: [
            Text(
              'Title',
              style: displayText,
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.2),
                border: Border.all(),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                style: titleStyle,
                controller: title,
              
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                maxLines: null,
              ),
            ),
            Text(
              'Description',
              style: displayText,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.2),
                border: Border.all(),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                controller: description,
                maxLines: null,
                 
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                style: editText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
