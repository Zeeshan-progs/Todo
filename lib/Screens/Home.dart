import 'package:flutter/material.dart';
import 'package:notes/Widgets/HomePage.dart';
import 'package:notes/widgets/AddPage.dart';
import 'package:notes/widgets/DeletedPage.dart';

bool isClick = false;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  List pages = [
    HomePage(),
    AddNote(),
    DeletedNote(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: pages[currentPage],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }


// App bar
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'To Do ',
        style: TextStyle(
          fontSize: 20,
          color: Colors.deepPurple,
        ),
      ),
    );
  }



  
// bottom Navigation Bar
  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      onTap: (index) {
        setState(() {
          currentPage = index;
          print(index.toString());
        });
      },
      currentIndex: currentPage,
      items: [
        BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.home,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add,
          ),
          label: 'Add',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.delete,
            ),
            label: 'Deleted'),
      ],
    );
  }
}
