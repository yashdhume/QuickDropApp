import 'package:flutter/material.dart';
import 'package:quickdrop/LoginPage/LoginPage.dart';
import 'OvalClip.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final Color primary = Color(0xff291747);
final Color active = Colors.white;

buildDrawer(BuildContext context) {
  return ClipPath(
    clipper: OvalRightBorderClipper(),
    child: Drawer(
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 40),
        decoration: BoxDecoration(
            color: primary,
            boxShadow: [BoxShadow(color: Colors.black45)],
            gradient:
                LinearGradient(colors: [Color(0xff48c6ef), Color(0xff6f86d6)])),
        width: 300,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [Color(0xff48c6ef), Color(0xff6f86d6)])),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage("sjit.png"),
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Yash Dhume",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                SizedBox(height: 30.0),
                _buildRow(Icons.home, "Home", context),
                _buildDivider(),
                _buildRow(Icons.folder, "Files", context),
                _buildDivider(),
                _buildRow(Icons.people, "Freinds", context),
                _buildDivider(),
                _buildRow(Icons.settings, "Settings", context),
                _buildDivider(),
                _buildRow(Icons.info, "Help", context),
                _buildDivider(),
                _buildRow(FontAwesomeIcons.signOutAlt, "Sign Out", context),
                _buildDivider()
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Divider _buildDivider() {
  return Divider(
    color: active,
  );
}

Widget _buildRow(IconData icon, String title, BuildContext context) {
  final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginPage(),
        )),
        child: Row(children: [
          Icon(
            icon,
            color: active,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: tStyle,
          ),
        ]),
      ));
}
