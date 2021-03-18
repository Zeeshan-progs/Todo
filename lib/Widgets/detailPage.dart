import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/const/const.dart';

import 'EditPage.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  DocumentSnapshot detailView;
  DetailPage({this.detailView});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
          title: Text('Detail Page '),
        ),
        body: buildDetailPage(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditPage(
                  editPage: widget.detailView,
                ),
              ),
            );
          },
          child: Icon(Icons.edit),
        ));
  }

  Container buildDetailPage() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      width: double.infinity,
      child: ListView(
        children: [
          Text('Title ', style: displayText),
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
          Container(
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
              style: editText.copyWith(
                fontSize: 23,
              ),
              maxLines: null,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
