import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:leja/utils/validator/validator.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  String noteTitle = '';
  String noteDesc = '';

  TextEditingController noteTitleController = TextEditingController();
  TextEditingController noteDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(appBar: AppBar(actions: [ Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
              ElevatedButton(
                  onPressed: () {
                    add();
                  },
                  child: const Text('Save')),
            ],
          ),],title: const Text('Add Note'),),
      // floatingActionButton:
      //     FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      body: Scrollbar(
          child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
         
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLines: 2,
              autofocus: true,
              key: const ValueKey('noteTitle'),
              // focusNode: _focusEmail,
              validator: (value) => Validator.validateEmail(
                email: value,
              ),
              onSaved: (value) {
                setState(() {
                  noteTitle = value!;
                });
              },
              onChanged: (value) {
                noteTitle = value;
              },
              controller: noteTitleController,
              obscureText: false,
              decoration:const InputDecoration(
                labelText: 'New Note Title',
                labelStyle:  TextStyle(
                  fontFamily: 'Lexend Deca',
                  // color: Color(0xFF95A1AC),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                hintText: 'Enter your new note title here...',
                hintStyle:  TextStyle(
                  fontFamily: 'Lexend Deca',
                  // color: Color(0xFF95A1AC),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder:InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: true,
                // fillColor: Colors.white,
              ),
              style: const TextStyle(
                fontFamily: 'Lexend Deca',
                // color: Color(0xFF2B343A),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLines: 20,
              autofocus: false,
              key: const ValueKey('noteDesc'),
              // focusNode: _focusEmail,
              validator: (value) => Validator.validateEmail(
                email: value,
              ),
              onSaved: (value) {
                setState(() {
                  noteDesc = value!;
                });
              },
              onChanged: (value) {
                noteDesc = value;
              },
              controller: noteDescController,
              obscureText: false,
              decoration:const InputDecoration(
                labelText: 'New Note Description',
                labelStyle:  TextStyle(
                  fontFamily: 'Lexend Deca',
                  // color: Color(0xFF95A1AC),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                hintText: 'Enter your new note description here...',
                hintStyle:  TextStyle(
                  fontFamily: 'Lexend Deca',
                  // color: Color(0xFF95A1AC),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder:InputBorder.none,
                focusedBorder:InputBorder.none,
                filled: true,
                // fillColor: Colors.white,
              ),
              style: const TextStyle(
                fontFamily: 'Lexend Deca',
                // color: Color(0xFF2B343A),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      )),
    ));
  }

  void add() async {
    CollectionReference ref = FirebaseFirestore.instance
        .collection('UserData')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Notes');
    var data = {
      'noteTitle': noteTitle,
      'noteDesc': noteDesc,
      'created': DateTime.now(),
    };
    ref.add(data);
    Navigator.pop(context);
  }
}
