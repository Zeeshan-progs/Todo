import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/const/const.dart';
import 'detailPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final reference = FirebaseFirestore.instance.collection('note');
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(5),
      child: StreamBuilder<QuerySnapshot>(
          stream: reference.snapshots(includeMetadataChanges: true),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                ),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: Text('No data '),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return Text('Loading .....');
            }
            return buildListView(snapshot);
          }),
    );
  }

// showing data to a list
  ListView buildListView(AsyncSnapshot<QuerySnapshot> snapshot) {
    return ListView.builder(
      itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  detailView: snapshot.data.docs[index],
                ),
              ),
            );
          },
          // custom list style 
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            margin: EdgeInsets.all(15),
            width: double.infinity,
            height: 100,
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 5,
                  height: double.infinity,
                  color: Colors.green,
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      snapshot.data.docs[index].data()['title'].toUpperCase(),
                      style:titleStyle,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
