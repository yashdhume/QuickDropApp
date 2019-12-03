import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:quickdrop/ViewModel.dart';
import '../../Network/HttpManager.dart';

class FileTransfer extends StatefulWidget {
  _FileTransfer createState() => _FileTransfer();
}

class _FileTransfer extends State<FileTransfer> {
  final String url = 'https://quickdropbeta.herokuapp.com';
  File file;
  String fileName;
  Uint8List bytes;

  void _chooseImage({bool isCamera}) async {
    var image;
    if(isCamera) {
      image = await ImagePicker.pickImage(
        source: ImageSource.camera,
        maxHeight: 240.0,
        maxWidth: 240.0,
      );
    }
    else{
      image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 240.0,
        maxWidth: 240.0,
      );

    }

    setState(() {
      file = image;
      fileName = file.path.split("/").last;
    });
  }



  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
      rebuildOnChange: true,
      builder: (context, child, model) => Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed:()=> _chooseImage(isCamera: true),
                child: Text('Choose Camera'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed:()=> _chooseImage(isCamera: false),
                child: Text('Choose Image'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () => model.upload(file),
                child: Text('Upload Image'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () => {
                  model.download().then((data) {
                    setState(() {
                      bytes = data;
                    });
                  })
                },
                child: Text('Download'),
              )
            ],
          ),
          file == null ? Text('No Image Selected') : Image.file(file),
          Text("Downloaded"),
          bytes == null ? Text("Not downloaded") : Image.memory(bytes)
        ],
      ),
    );
  }
}
