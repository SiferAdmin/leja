import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:leja/utils/validator/validator.dart';

class AddVault extends StatefulWidget {
  const AddVault({Key? key}) : super(key: key);

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddVault> {
  String itemTitle = '';
  String itemDesc = '';

  TextEditingController itemTitleController = TextEditingController();
  TextEditingController itemDescController = TextEditingController();

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
                  onPressed: () {
                    add();
                  },
                  child: const Text('Save')),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLines: 2,
              autofocus: true,
              key: const ValueKey('itemTitle'),
              // focusNode: _focusEmail,
              validator: (value) => Validator.validateEmail(
                email: value,
              ),
              onSaved: (value) {
                setState(() {
                  itemTitle = value!;
                });
              },
              onChanged: (value) {
                itemTitle = value;
              },
              controller: itemTitleController,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'New Item Title',
                labelStyle: const TextStyle(
                  fontFamily: 'Lexend Deca',
                  // color: Color(0xFF95A1AC),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                hintText: 'Enter your new item title here...',
                hintStyle: const TextStyle(
                  fontFamily: 'Lexend Deca',
                  // color: Color(0xFF95A1AC),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    // color: Color(0xFFDBE2E7),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    // color: Color(0xFFDBE2E7),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
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
              key: const ValueKey('itemDesc'),
              // focusNode: _focusEmail,
              validator: (value) => Validator.validateEmail(
                email: value,
              ),
              onSaved: (value) {
                setState(() {
                  itemDesc = value!;
                });
              },
              onChanged: (value) {
                itemDesc = value;
              },
              controller: itemDescController,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'New Item Description',
                labelStyle: const TextStyle(
                  fontFamily: 'Lexend Deca',
                  // color: Color(0xFF95A1AC),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                hintText: 'Enter your new item description here...',
                hintStyle: const TextStyle(
                  fontFamily: 'Lexend Deca',
                  // color: Color(0xFF95A1AC),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    // color: Color(0xFFDBE2E7),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    // color: Color(0xFFDBE2E7),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
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
        .collection('Vault');
    var data = {
      'itemTitle': itemTitle,
      'itemDesc': itemDesc,
      'created': DateTime.now(),
    };
    ref.add(data);
    Navigator.pop(context);
  }
}
