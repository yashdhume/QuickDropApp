import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final String heroTag;
  GradientAppBar(this.title, this.heroTag);

  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return new Container(
      height: statusBarHeight + 66,
      padding: new EdgeInsets.only(top: statusBarHeight),
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [Color(0xff48c6ef), Color(0xff6f86d6)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp)),
      child: new Center(
        child: new Hero(
          tag: heroTag,
            child: Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Franklin',
              //fontWeight: FontWeight.w600,
              fontSize: 26.0),
        )),
      ),
    );
  }
}
