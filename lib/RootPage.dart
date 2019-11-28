import 'package:flutter/material.dart';
import 'package:quickdrop/LoginPage/LoginPage.dart';
import 'ViewModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:quickdrop/Network/Authetication.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPage createState() => _RootPage();
}

class _RootPage extends State<RootPage> {
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
        rebuildOnChange: true, builder: (context, child, model) =>
        runSocket(model));
  }
}
bool isSocketRun = true;

Widget runSocket(ViewModel model){
  if(isSocketRun) {
    model.initSocket();
    isSocketRun = false;
    return LoginPage();

 }
  return LoginPage();
}