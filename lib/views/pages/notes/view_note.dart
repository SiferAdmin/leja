import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewNotePage extends StatefulWidget {
  final Map data;
  final String time;
  final DocumentReference ref;

  const ViewNotePage({
    Key? key,
    required this.data,
    required this.time,
    required this.ref,
  }) : super(key: key);

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<ViewNotePage> {
  String noteTitle = '';
  String noteDesc = '';

  TextEditingController noteTitleController = TextEditingController();
  TextEditingController noteDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // floatingActionButton:
      //     FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      body: Scrollbar(
          child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back)),
              ElevatedButton(
                  // style: ButtonStyle(
                  //     backgroundColor:
                  //         MaterialStateProperty.all(Colors.red[300])),
                  onPressed: () {
                    deleteNote();
                  },
                  child: const Icon(Icons.delete_forever_sharp)),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${widget.data['noteTitle']}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lexend Deca',
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.time),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${widget.data['noteDesc']}"),
              ),
            ],
          ),
        ],
      )),
    ));
  }

  void deleteNote() async {
    await widget.ref.delete();
    Navigator.pop(context);
  }
}
