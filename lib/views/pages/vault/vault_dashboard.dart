import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leja/views/pages/vault/add_vault.dart';
import 'package:leja/views/pages/vault/view_vault.dart';

class Vaultdashboard extends StatefulWidget {
  const Vaultdashboard({Key? key}) : super(key: key);

  @override
  _NotesDashboardState createState() => _NotesDashboardState();
}

class _NotesDashboardState extends State<Vaultdashboard> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('UserData')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Vault');
  List<Color?> myColors = [
    Colors.yellow[200],
    Colors.red[200],
    Colors.green[200],
    Colors.deepPurple[200],
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Vault'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const AddVault()))
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
                    Color? bg = myColors[random.nextInt(4)];
                    Map data = snapshot.data!.docs[index].data() as Map;
                    DateTime noteDateTime = data['created'].toDate();
                    String formattedTime =
                        DateFormat.yMMMd().add_jm().format(noteDateTime);
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                                builder: (context) => ViewVaultPage(
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${data['itemTitle']}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(DateFormat.yMMMd()
                                    .add_jm()
                                    .format(noteDateTime)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${data['itemDesc']}"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(child: Text('Loading Vault Items'));
            }
          }),
    ));
  }
}
