import 'package:flutter/material.dart';

class FilePicker extends StatefulWidget {
  const FilePicker({Key? key}) : super(key: key);

  @override
  _FilePickerState createState() => _FilePickerState();
}

class _FilePickerState extends State<FilePicker> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(title:const Text('Pick File')),body:Column(children: [
      ElevatedButton(onPressed:(){}, child:const Text('child'))
      
    ],) ,));
  }
}