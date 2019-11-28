import 'package:flutter/material.dart';
import 'RootPage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'ViewModel.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<ViewModel>(
        model: ViewModel(),
        child: MaterialApp(
          title: 'Okeano',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
            primaryColor: Color(0xff48c6ef),
            accentColor: Color(0xff6f86d6),
          ),
          home: RootPage(),
        ));
  }
}
