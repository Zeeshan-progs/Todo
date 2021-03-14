import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/Screens/Home.dart';

import '../../const/const.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  DocumentSnapshot detailView;
  DetailPage({this.detailView});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClick = true;
  void updateData() {
    widget.detailView.reference.update({
      'title': title.text,
      'dscription': description.text,
    }).whenComplete(() {
      setState(() {
        isClick = !isClick;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      });
    });
  }

  void trash() {
    widget.detailView.reference.delete().whenComplete(() => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    title = TextEditingController(text: widget.detailView.data()['title']);
    description =
        TextEditingController(text: widget.detailView.data()['description']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          isClick
              ? Text('')
              : IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    trash();
                  },
                ),
        ],
      ),
      body: isClick ? buildDetailPage() : buildEditPage(context),
      floatingActionButton: isClick
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  isClick = !isClick;
                });
              },
              child: Icon(Icons.edit),
            )
          : FloatingActionButton(
              onPressed: () {
                updateData();
              },
              child: Icon(Icons.save),
            ),
    );
  }

  Container buildEditPage(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: TextFormField(
                controller: title,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Title',
                    hintStyle: editText),
                style: editText),
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
                style: editText,
              ),),
        ],
      ),
    );
  }

  Container buildDetailPage() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      height: double.infinity,
      width: double.infinity,
      child: ListView(
        children: [
          Text(
            'Title ',
            style:displayText
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              bottom: 30,
              top: 10,
            ),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              widget.detailView.data()['title'].toUpperCase(),
              style: titleStyle,
              maxLines: null,
            ),
          ),
          Text(
            'Description ',
            style: displayText,
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(
                bottom: 20,
                top: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                widget.detailView.data()['description'],
                style: displayText.copyWith(fontSize: 23,),
                maxLines: null,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
