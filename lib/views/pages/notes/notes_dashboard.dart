import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leja/main.dart';
import 'package:leja/views/pages/notes/add_note.dart';
import 'package:leja/views/pages/notes/view_note.dart';

class NotesDashboard extends StatefulWidget {
  const NotesDashboard({Key? key}) : super(key: key);

  @override
  _NotesDashboardState createState() => _NotesDashboardState();
}

class _NotesDashboardState extends State<NotesDashboard> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('UserData')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Notes');
  List<Color?> myColors = [
    Colors.yellow[500],
    Colors.red[500],
    Colors.green[500],
    Colors.deepPurple[00],
  ];
  List<Color?> myColors1 = [
    Colors.yellow[100],
    Colors.red[100],
    Colors.green[100],
    Colors.deepPurple[100],
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => const AddNotePage()))
                .then((value) {
              setState(() {});
            });
          },
          child: const Icon(Icons.add)),
      body: FutureBuilder<QuerySnapshot>(
          future: ref.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Random random = Random();
                    Color? bg = isBrightMode
                        ? myColors1[random.nextInt(4)]
                        : myColors[random.nextInt(4)];
                    Map data = snapshot.data!.docs[index].data() as Map;
                    DateTime noteDateTime = data['created'].toDate();
                    String formattedTime =
                        DateFormat.yMMMd().add_jm().format(noteDateTime);
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                                builder: (context) => ViewNotePage(
                                      data: data,
                                      ref: snapshot.data!.docs[index].reference,
                                      time: formattedTime,
                                    )))
                            .then((value) {
                          setState(() {});
                        });
                      },
                      child: Card(
                        color: bg,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${data['noteTitle']}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lexend Deca',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(DateFormat.yMMMd()
                                      .add_jm()
                                      .format(noteDateTime)
                                      .replaceAll('de', '')),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${data['noteDesc']}"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(child: Text('Loading Notes'));
            }
          }),
    ));
  }
}
