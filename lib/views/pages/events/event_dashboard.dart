import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leja/main.dart';
import 'package:leja/views/pages/events/create_events.dart';
import 'package:leja/views/pages/events/edit_event.dart';
import 'package:leja/views/pages/events/view_event.dart';

class EventDashboard extends StatefulWidget {
  const EventDashboard({Key? key}) : super(key: key);

  @override
  _EventDashboardState createState() => _EventDashboardState();
}

class _EventDashboardState extends State<EventDashboard> {
  DateTime? to;
  DateTime? now = DateTime.now();
  DateTime? endDateTime;

  CollectionReference ref = FirebaseFirestore.instance
      .collection('UserData')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Events');
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // FirebaseFirestore.instance
  // .collection('users')
  // .where('age', isGreaterThan: 20)
  // .get()
  // .then(...);

  @override
  Widget build(BuildContext context) {
    //   FirebaseFirestore.instance
    // .collection('users')
    // .where('age', isGreaterThan: 20)
    // .get()
    // .then(...);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Event',
          style: GoogleFonts.getFont(
            'Lexend Deca',
          ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 4,
      ),
      // backgroundColor: const Color(0xFFF5F5F5),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // print('FloatingActionButton pressed ...');
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CreateEvent()));
        },
        icon: const FaIcon(
          FontAwesomeIcons.featherAlt,
        ),
        elevation: 8,
        label: const Text(
          'Create Event',
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            FutureBuilder<QuerySnapshot>(
                future: ref.get(),
                builder: (context, snapshot) {
                  int counter = 0;

                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        GridView(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              // color: const Color(0xFFF5F5F5),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Text(
                                      'All \nEvents',
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.dollyFlatbed,
                                        // color: Colors.black,
                                        size: 24,
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10, 10, 10, 10),
                                        child: Text(
                                          snapshot.data!.docs.length.toString(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              // color: const Color(0xFFF5F5F5),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Text(
                                      'Active \nEvents',
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.dolly,
                                        // color: Colors.black,
                                        size: 24,
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10, 10, 10, 10),
                                        child: Text(
                                          counter.toString(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              // color: const Color(0xFFF5F5F5),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Text(
                                      'Closed Events',
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      FaIcon(
                                        FontAwesomeIcons.trailer,
                                        // color: Colors.black,
                                        size: 24,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: Text(
                                          '3',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              Map data =
                                  snapshot.data!.docs[index].data() as Map;

                              DateTime eventDateTime = data['created'].toDate();

                              DateTime startDateTime = data['from'].toDate();
                              endDateTime = data['to'].toDate();
                              bool allDay = data['allDay'];
                              String eventTitle = data['title'];
                              String eventDesc = data['desc'];
                              String doc = snapshot.data!.docs[index].id;
                              print('=====================================');
                              print(doc);
                              if (endDateTime!.isBefore(now!)) {
                                setState(() {
                                  counter++;
                                });
                              } else {}

                              // counter++;

                              return

                                  //  Text(eventTitle);
                                  Slidable(
                                endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        label: 'Edit',
                                        foregroundColor:
                                            bright == Brightness.light
                                                ? const Color(0xFFF687D4)
                                                : Colors.pink,
                                        backgroundColor:
                                            bright == Brightness.light
                                                ? Colors.white
                                                : Colors.black,
                                        autoClose: true,
                                        // color: Colors.blue,
                                        icon: FontAwesomeIcons.solidEdit,
                                        onPressed: (context) {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditEvent(
                                                        eventDoc: doc,
                                                      )));
                                        },
                                      ),
                                      SlidableAction(
                                          label: 'Close',
                                          foregroundColor:
                                              bright == Brightness.light
                                                  ? const Color(0xFFF687D4)
                                                  : Colors.pink,
                                          backgroundColor:
                                              bright == Brightness.light
                                                  ? Colors.white
                                                  : Colors.black,
                                          autoClose: true,
                                          // color: Colors.blue,
                                          icon: FontAwesomeIcons.doorClosed,
                                          onPressed: (context) {}),
                                    ]),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ViewEvent()));
                                  },
                                  title: Text(
                                    eventTitle,
                                  ),
                                  subtitle: Text(
                                    eventDesc,
                                  ),
                                  trailing: FaIcon(
                                    FontAwesomeIcons.solidEye,
                                    color: bright == Brightness.light
                                        ? const Color(0xFFF687D4)
                                        : Colors.pink,
                                    size: 20,
                                  ),
                                  dense: false,
                                ),
                              );
                            }),
                      ],
                    );
                  } else {
                    return const Center(child: Text('Loading Events'));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
