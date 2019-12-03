import 'package:flutter/material.dart';
import 'package:quickdrop/Network/FileTransfer.dart';
import 'NavigationDrawer.dart';
import 'GradientAppBar.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
  }
  int currentIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context){
    return Scaffold(
      key: _key,
      drawer: buildDrawer(context),
      bottomNavigationBar: BottomNavyBar(

        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
        }),

        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Color(0xff48c6ef),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.folder),
            title: Text('Files'),
            activeColor: Color(0xff48c6ef),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Freinds'),
            activeColor: Color(0xff48c6ef),
          ),
        ],
      ),
      appBar:  new PreferredSize(
        child: new Container(
          padding: new EdgeInsets.only(
              top: MediaQuery.of(context).padding.top
          ),
          child: new Padding(
            padding: const EdgeInsets.only(
                left: 30.0,
                top: 20.0,
                bottom: 20.0
            ),
            child: Hero(tag: "logoTag",child: new Image.asset("assets/logo.png")),
          ),
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Color(0xff48c6ef), Color(0xff6f86d6)
                  ]
              ),
              boxShadow: [
                new BoxShadow(
                  color: Colors.black,
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                )
              ]
          ),
        ),
        preferredSize: new Size(
            MediaQuery.of(context).size.width,
            150.0
        ),
      ),
      body: new Column(
        children: <Widget>[
          //new GradientAppBar("Quick Drop", "titleTag"),
          new A(),
        ],
      ),
    );
  }
}