
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:leja/views/pages/events/event_dashboard.dart';
import 'package:leja/views/pages/notes/notes_dashboard.dart';
import 'package:leja/views/pages/profile/profile_page.dart';
import 'package:leja/views/pages/projects/projects_dashboard.dart';
import 'package:leja/views/pages/sales/sales_dashboard.dart';
import 'package:leja/views/pages/stocks/stocks_dashboard.dart';
import 'package:leja/views/pages/transaction/transaction_dashboard.dart';
import 'package:leja/views/widgets/date_time_picker.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<Dashboard> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  String name = 'User';

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      // developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference loggedUser =
        FirebaseFirestore.instance.collection('UserData');
    // ignore: unused_local_variable
    var _imagePath =
        loggedUser.doc(FirebaseAuth.instance.currentUser!.uid).get();
    // @override
    // initState() {
    //   super.initState();

    //   var subscription = Connectivity()
    //       .onConnectivityChanged
    //       .listen((ConnectivityResult result) {
    //     // Got a new connectivity status!
    //   });
    // }

    // ignore: unused_local_variable
    var brightnes = MediaQuery.of(context).platformBrightness;
    // ignore: avoid_print
    // ignore: avoid_print

    Center(child: Text('Connection Status: ${_connectionStatus.toString()}'));
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    String dateNow = formatter.format(DateTime.now());
    // var user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: InkWell(
            onLongPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DateP(),
                ),
              );
            },
            child: const Text('Dashboard')),
      ),
      // backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ProfilePage(),
                                ),
                              );
                            },
                            child: Stack(
                                alignment: const AlignmentDirectional(
                                    .9, -0.89999999999999999),
                                children: [
                                  FutureBuilder<DocumentSnapshot>(
                                    future: loggedUser
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        .get(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<DocumentSnapshot>
                                            snapshot) {
                                      if (snapshot.hasError) {
                                        return const Text(
                                            "Something went wrong");
                                      }

                                      if (snapshot.hasData &&
                                          !snapshot.data!.exists) {
                                        return const Text(
                                            "Data requested does not exist");
                                      }

                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        Map<String, dynamic> data =
                                            snapshot.data!.data()
                                                as Map<String, dynamic>;
                                        return Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          // color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(2, 2, 2, 2),
                                            child: Container(
                                              width: 60,
                                              height: 60,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: CachedNetworkImage(
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                              downloadProgress) =>
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: SizedBox(
                                                              height: 10,
                                                              width: 10,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        14.0),
                                                                child: SizedBox(
                                                                  height: 10,
                                                                  width: 10,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    strokeWidth:
                                                                        2,
                                                                    value: downloadProgress
                                                                        .progress,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                  imageUrl:
                                                      "${data['pic_link']}"),
                                            ),
                                          ),
                                        );
                                      }
                                      return const Text("loading");
                                    },
                                  ),
                                  Align(
                                    // ignore: prefer_const_constructors
                                    alignment:
                                        const AlignmentDirectional(0.5, 1.8),
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: _connectionStatus.toString() ==
                                                'ConnectivityResult.none'
                                            ? Colors.red
                                            : Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Text(
                                  'Welcome,',
                                  style: TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    // color: const Color(0xFF1E2429),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: FutureBuilder<DocumentSnapshot>(
                                    future: loggedUser
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        .get(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<DocumentSnapshot>
                                            snapshot) {
                                      if (snapshot.hasError) {
                                        return const Text(
                                            "Something went wrong");
                                      }

                                      if (snapshot.hasData &&
                                          !snapshot.data!.exists) {
                                        return const Text(
                                            "Data requested does not exist");
                                      }

                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        Map<String, dynamic> data =
                                            snapshot.data!.data()
                                                as Map<String, dynamic>;
                                        return Text(
                                          "${data['name']}",
                                          style: const TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            // color: const Color(0xFF1E2429),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        );
                                      }
                                      return const Text("loading");
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                'Your latest updates are below.',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  // color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.92,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 6,
                          // color: Color(0x4B1A1F24),
                          offset: Offset(0, 2),
                        )
                      ],
                      gradient: const LinearGradient(
                        colors: [Color(0xFF00968A), Color(0xFFF2A384)],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0.94, -1),
                        end: AlignmentDirectional(-0.94, 1),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 10,
                                      width: 10,
                                      child: Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: SizedBox(
                                          height: 10,
                                          width: 10,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 4,
                                            value: downloadProgress.progress,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                imageUrl:
                                    'https://www.linkpicture.com/q/transparent-logo.png',
                                width: 200,
                                height: 90,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 24, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Text(
                                '',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  // color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 8, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Text(
                                '',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  // color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 12, 10, 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                'Date: ',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  // color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                dateNow,
                                style: const TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  // color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Text(
                              'Quick Actions',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                // color: Color(0xFF090F13),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // ElevatedButton(
                            //   onPressed: () {},
                            //   style: ElevatedButton.styleFrom(
                            //       fixedSize: Size(
                            //           MediaQuery.of(context).size.width * 0.28,
                            //           MediaQuery.of(context).orientation ==
                            //                   Orientation.portrait
                            //               ? MediaQuery.of(context).size.height *
                            //                   0.12
                            //               : MediaQuery.of(context).size.height *
                            //                   0.25)),
                            //   // width: 80,
                            //   // height: 80,
                            //   // decoration: BoxDecoration(
                            //   //   // color: isDark ? Colors.black : Colors.white,
                            //   //   boxShadow: const [
                            //   //     BoxShadow(
                            //   //       blurRadius: 5,
                            //   //       // color: Color(0x3B000000),
                            //   //       offset: Offset(0, 2),
                            //   //     )
                            //   //   ],
                            //   //   borderRadius: BorderRadius.circular(8),
                            //   // ),
                            //   child: Padding(
                            //     padding: const EdgeInsetsDirectional.fromSTEB(
                            //         4, 4, 4, 4),
                            //     child: Column(
                            //       mainAxisSize: MainAxisSize.max,
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: const [
                            //         Icon(
                            //           Icons.account_balance_wallet_sharp,
                            //           // color:
                            //           //     isDark ? Colors.black : Colors.white,
                            //           size: 40,
                            //         ),
                            //         Padding(
                            //           padding: EdgeInsetsDirectional.fromSTEB(
                            //               0, 8, 0, 0),
                            //           child: Text(
                            //             'Accounts',
                            //             style: TextStyle(
                            //               fontFamily: 'Lexend Deca',
                            //               // color: Color(0xFF090F13),
                            //               fontSize: 14,
                            //               fontWeight: FontWeight.normal,
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const NotesDashboard()));
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.28,
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.height *
                                              0.12
                                          : MediaQuery.of(context).size.height *
                                              0.25)),
                              // width: 80,
                              // height: 80,
                              // decoration: BoxDecoration(
                              //   // color: isDark ? Colors.black : Colors.white,
                              //   boxShadow: const [
                              //     BoxShadow(
                              //       blurRadius: 5,
                              //       // color: isDark ? Colors.black : Colors.white,
                              //       offset: Offset(0, 2),
                              //     )
                              //   ],
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.note_alt_sharp,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Notes',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const EventDashboard()));
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.28,
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.height *
                                              0.12
                                          : MediaQuery.of(context).size.height *
                                              0.25)),

                              // width: 80,
                              // height: 80,
                              // decoration: BoxDecoration(
                              //   // color: isDark ? Colors.black : Colors.white,
                              //   boxShadow: const [
                              //     BoxShadow(
                              //       blurRadius: 5,
                              //       // color: Color(0x39000000),
                              //       offset: Offset(0, 2),
                              //     )
                              //   ],
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.date_range_sharp,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Events',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ProjectsDashboard()));
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.28,
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.height *
                                              0.12
                                          : MediaQuery.of(context).size.height *
                                              0.25)),
                              // width: 80,
                              // height: 80,
                              // decoration: BoxDecoration(
                              //   // color: isDark ? Colors.black : Colors.white,
                              //   boxShadow: const [
                              //     BoxShadow(
                              //       blurRadius: 5,
                              //       // color: Color(0x39000000),
                              //       offset: Offset(0, 2),
                              //     )
                              //   ],
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.maps_home_work_sharp,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Projects',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const StockDashboardWidget()))
                                    .then((value) {});
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.28,
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.height *
                                              0.12
                                          : MediaQuery.of(context).size.height *
                                              0.25)),
                              // width: 80,
                              // height: 80,
                              // decoration: BoxDecoration(
                              //   // color: isDark ? Colors.black : Colors.white,
                              //   boxShadow: const [
                              //     BoxShadow(
                              //       blurRadius: 5,
                              //       // color: Color(0x3B000000),
                              //       offset: Offset(0, 2),
                              //     )
                              //   ],
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.add_shopping_cart_sharp,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Stocks',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const SaleDashboardWidget()))
                                    .then((value) {});
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.28,
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.height *
                                              0.12
                                          : MediaQuery.of(context).size.height *
                                              0.25)),
                              // width: 80,
                              // height: 80,
                              // decoration: BoxDecoration(
                              //   // color: isDark ? Colors.black : Colors.white,
                              //   boxShadow: const [
                              //     BoxShadow(
                              //       blurRadius: 5,
                              //       // color: Color(0x3B000000),
                              //       offset: Offset(0, 2),
                              //     )
                              //   ],
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.work_outline_rounded,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Sales',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // ElevatedButton(
                            //   onPressed: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (context) =>
                            //             const Vaultdashboard()));
                            //   },
                            //   style: ElevatedButton.styleFrom(
                            //       fixedSize: Size(
                            //           MediaQuery.of(context).size.width * 0.28,
                            //           MediaQuery.of(context).orientation ==
                            //                   Orientation.portrait
                            //               ? MediaQuery.of(context).size.height *
                            //                   0.12
                            //               : MediaQuery.of(context).size.height *
                            //                   0.25)),
                            //   // width: 80,
                            //   // height: 80,
                            //   // decoration: BoxDecoration(
                            //   //   // color: isDark ? Colors.black : Colors.white,
                            //   //   boxShadow: const [
                            //   //     BoxShadow(
                            //   //       blurRadius: 5,
                            //   //       // color: isDark ? Colors.black : Colors.white,
                            //   //       offset: Offset(0, 2),
                            //   //     )
                            //   //   ],
                            //   //   borderRadius: BorderRadius.circular(8),
                            //   // ),
                            //   child: Padding(
                            //     padding: const EdgeInsetsDirectional.fromSTEB(
                            //         4, 4, 4, 4),
                            //     child: Column(
                            //       mainAxisSize: MainAxisSize.max,
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: const [
                            //         Icon(
                            //           Icons.miscellaneous_services_sharp,
                            //           // color:
                            //           //     isDark ? Colors.black : Colors.white,
                            //           size: 40,
                            //         ),
                            //         Padding(
                            //           padding: EdgeInsetsDirectional.fromSTEB(
                            //               0, 8, 0, 0),
                            //           child: Text(
                            //             'Vault',
                            //             style: TextStyle(
                            //               fontFamily: 'Lexend Deca',
                            //               // color: Color(0xFF090F13),
                            //               fontSize: 14,
                            //               fontWeight: FontWeight.normal,
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const TramsactionDashboardWidget()));
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.28,
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.height *
                                              0.12
                                          : MediaQuery.of(context).size.height *
                                              0.25)),
                              // width: 80,
                              // height: 80,
                              // decoration: BoxDecoration(
                              //   // color: isDark ? Colors.black : Colors.white,
                              //   boxShadow: const [
                              //     BoxShadow(
                              //       blurRadius: 5,
                              //       // color: Color(0x39000000),
                              //       offset: Offset(0, 2),
                              //     )
                              //   ],
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.rule_sharp,
                                      // color:
                                      //     isDark ? Colors.black : Colors.white,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Expense & Income',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          // color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            // ElevatedButton(
                            //   onPressed: () {},
                            //   style: ElevatedButton.styleFrom(
                            //       fixedSize: Size(
                            //           MediaQuery.of(context).size.width * 0.28,
                            //           MediaQuery.of(context).orientation ==
                            //                   Orientation.portrait
                            //               ? MediaQuery.of(context).size.height *
                            //                   0.12
                            //               : MediaQuery.of(context).size.height *
                            //                   0.25)),
                            //   // width: 80,
                            //   // height: 80,
                            //   // decoration: BoxDecoration(
                            //   //   // color: isDark ? Colors.black : Colors.white,
                            //   //   boxShadow: const [
                            //   //     BoxShadow(
                            //   //       blurRadius: 5,
                            //   //       // color: isDark ? Colors.black : Colors.white,
                            //   //       offset: Offset(0, 2),
                            //   //     )
                            //   //   ],
                            //   //   borderRadius: BorderRadius.circular(8),
                            //   // ),
                            //   child: Padding(
                            //     padding: const EdgeInsetsDirectional.fromSTEB(
                            //         4, 4, 4, 4),
                            //     child: Column(
                            //       mainAxisSize: MainAxisSize.max,
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: const [
                            //         Icon(
                            //           Icons.eco_sharp,
                            //           // color:
                            //           //     isDark ? Colors.black : Colors.white,
                            //           size: 40,
                            //         ),
                            //         Padding(
                            //           padding: EdgeInsetsDirectional.fromSTEB(
                            //               0, 8, 0, 0),
                            //           child: Text(
                            //             'Income',
                            //             style: TextStyle(
                            //               fontFamily: 'Lexend Deca',
                            //               // color: Color(0xFF090F13),
                            //               fontSize: 14,
                            //               fontWeight: FontWeight.normal,
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsetsDirectional.fromSTEB(
                      //       20, 12, 20, 12),
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.max,
                      //     children: const [
                      //       Text(
                      //         'Recent Activity',
                      //         style: TextStyle(
                      //           fontFamily: 'Lexend Deca',
                      //           // color: Color(0xFF090F13),
                      //           fontSize: 14,
                      //           fontWeight: FontWeight.normal,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width * 0.92,
                      //   height: 70,
                      //   decoration: BoxDecoration(
                      //     // color: const Color(0xFFF4F5F7),
                      //     borderRadius: BorderRadius.circular(8),
                      //   ),
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.max,
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsetsDirectional.fromSTEB(
                      //             8, 0, 0, 0),
                      //         child: Card(
                      //           clipBehavior: Clip.antiAliasWithSaveLayer,
                      //           // color: const Color(0x6639D2C0),
                      //           shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(40),
                      //           ),
                      //           child: const Padding(
                      //             padding: EdgeInsetsDirectional.fromSTEB(
                      //                 8, 8, 8, 8),
                      //             child: Icon(
                      //               Icons.monetization_on_rounded,
                      //               // color: Color(0xFF39D2C0),
                      //               size: 24,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: Padding(
                      //           padding: const EdgeInsetsDirectional.fromSTEB(
                      //               12, 0, 0, 0),
                      //           child: Column(
                      //             mainAxisSize: MainAxisSize.max,
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: const [
                      //               Text(
                      //                 'Hotel A',
                      //                 style: TextStyle(
                      //                   fontFamily: 'Lexend Deca',
                      //                   // color: Color(0xFF1E2429),
                      //                   fontSize: 18,
                      //                   fontWeight: FontWeight.w500,
                      //                 ),
                      //               ),
                      //               Padding(
                      //                 padding: EdgeInsetsDirectional.fromSTEB(
                      //                     0, 4, 0, 0),
                      //                 child: Text(
                      //                   'Income',
                      //                   style: TextStyle(
                      //                     fontFamily: 'Lexend Deca',
                      //                     // color: Color(0xFF090F13),
                      //                     fontSize: 14,
                      //                     fontWeight: FontWeight.normal,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsetsDirectional.fromSTEB(
                      //             12, 0, 12, 0),
                      //         child: Column(
                      //           mainAxisSize: MainAxisSize.max,
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           crossAxisAlignment: CrossAxisAlignment.end,
                      //           children: const [
                      //             Text(
                      //               'KSH 50.00',
                      //               textAlign: TextAlign.end,
                      //               style: TextStyle(
                      //                 fontFamily: 'Lexend Deca',
                      //                 // color: Color(0xFF39D2C0),
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w500,
                      //               ),
                      //             ),
                      //             Padding(
                      //               padding: EdgeInsetsDirectional.fromSTEB(
                      //                   0, 4, 0, 0),
                      //               child: Text(
                      //                 'Detol',
                      //                 textAlign: TextAlign.end,
                      //                 style: TextStyle(
                      //                   fontFamily: 'Lexend Deca',
                      //                   // color: Color(0xFF090F13),
                      //                   fontSize: 12,
                      //                   fontWeight: FontWeight.normal,
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding:
                      //       const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      //   child: Container(
                      //     width: MediaQuery.of(context).size.width * 0.92,
                      //     height: 70,
                      //     decoration: BoxDecoration(
                      //       // color: const Color(0xFFF4F5F7),
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //     child: Row(
                      //       mainAxisSize: MainAxisSize.max,
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsetsDirectional.fromSTEB(
                      //               8, 0, 0, 0),
                      //           child: Card(
                      //             clipBehavior: Clip.antiAliasWithSaveLayer,
                      //             // color: const Color(0x6639D2C0),
                      //             shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(40),
                      //             ),
                      //             child: const Padding(
                      //               padding: EdgeInsetsDirectional.fromSTEB(
                      //                   8, 8, 8, 8),
                      //               child: Icon(
                      //                 Icons.monetization_on_rounded,
                      //                 // color: Color(0xFF39D2C0),
                      //                 size: 24,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         Expanded(
                      //           child: Padding(
                      //             padding: const EdgeInsetsDirectional.fromSTEB(
                      //                 12, 0, 0, 0),
                      //             child: Column(
                      //               mainAxisSize: MainAxisSize.max,
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: const [
                      //                 Text(
                      //                   'Hotel B',
                      //                   style: TextStyle(
                      //                     fontFamily: 'Lexend Deca',
                      //                     // color: Color(0xFF1E2429),
                      //                     fontSize: 18,
                      //                     fontWeight: FontWeight.w500,
                      //                   ),
                      //                 ),
                      //                 Padding(
                      //                   padding: EdgeInsetsDirectional.fromSTEB(
                      //                       0, 4, 0, 0),
                      //                   child: Text(
                      //                     'Income',
                      //                     style: TextStyle(
                      //                       fontFamily: 'Lexend Deca',
                      //                       // color: Color(0xFF090F13),
                      //                       fontSize: 14,
                      //                       fontWeight: FontWeight.normal,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsetsDirectional.fromSTEB(
                      //               12, 0, 12, 0),
                      //           child: Column(
                      //             mainAxisSize: MainAxisSize.max,
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             crossAxisAlignment: CrossAxisAlignment.end,
                      //             children: const [
                      //               Text(
                      //                 'KSH 50.00',
                      //                 textAlign: TextAlign.end,
                      //                 style: TextStyle(
                      //                   fontFamily: 'Lexend Deca',
                      //                   // color: Color(0xFF39D2C0),
                      //                   fontSize: 16,
                      //                   fontWeight: FontWeight.w500,
                      //                 ),
                      //               ),
                      //               Padding(
                      //                 padding: EdgeInsetsDirectional.fromSTEB(
                      //                     0, 4, 0, 0),
                      //                 child: Text(
                      //                   'Jik',
                      //                   textAlign: TextAlign.end,
                      //                   style: TextStyle(
                      //                     fontFamily: 'Lexend Deca',
                      //                     // color: Color(0xFF090F13),
                      //                     fontSize: 12,
                      //                     fontWeight: FontWeight.normal,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding:
                      //       const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                      //   child: Container(
                      //     width: MediaQuery.of(context).size.width * 0.92,
                      //     height: 70,
                      //     decoration: BoxDecoration(
                      //       // color: const Color(0xFFF4F5F7),
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //     child: Row(
                      //       mainAxisSize: MainAxisSize.max,
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsetsDirectional.fromSTEB(
                      //               8, 0, 0, 0),
                      //           child: Card(
                      //             clipBehavior: Clip.antiAliasWithSaveLayer,
                      //             // color: const Color(0x6639D2C0),
                      //             shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(40),
                      //             ),
                      //             child: const Padding(
                      //               padding: EdgeInsetsDirectional.fromSTEB(
                      //                   8, 8, 8, 8),
                      //               child: Icon(
                      //                 Icons.monetization_on_rounded,
                      //                 // color: Color.fromARGB(255, 226, 60, 212),
                      //                 size: 24,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         Expanded(
                      //           child: Padding(
                      //             padding: const EdgeInsetsDirectional.fromSTEB(
                      //                 12, 0, 0, 0),
                      //             child: Column(
                      //               mainAxisSize: MainAxisSize.max,
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: const [
                      //                 Text(
                      //                   'Hotel C',
                      //                   style: TextStyle(
                      //                     fontFamily: 'Lexend Deca',
                      //                     // color: Color(0xFF1E2429),
                      //                     fontSize: 18,
                      //                     fontWeight: FontWeight.w500,
                      //                   ),
                      //                 ),
                      //                 Padding(
                      //                   padding: EdgeInsetsDirectional.fromSTEB(
                      //                       0, 4, 0, 0),
                      //                   child: Text(
                      //                     'Income',
                      //                     style: TextStyle(
                      //                       fontFamily: 'Lexend Deca',
                      //                       // color: Color(0xFF090F13),
                      //                       fontSize: 14,
                      //                       fontWeight: FontWeight.normal,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsetsDirectional.fromSTEB(
                      //               12, 0, 12, 0),
                      //           child: Column(
                      //             mainAxisSize: MainAxisSize.max,
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             crossAxisAlignment: CrossAxisAlignment.end,
                      //             children: const [
                      //               Text(
                      //                 'KSH 50.00',
                      //                 textAlign: TextAlign.end,
                      //                 style: TextStyle(
                      //                   fontFamily: 'Lexend Deca',
                      //                   // color: Color.fromARGB(255, 9, 102, 40),
                      //                   fontSize: 16,
                      //                   fontWeight: FontWeight.w500,
                      //                 ),
                      //               ),
                      //               Padding(
                      //                 padding: EdgeInsetsDirectional.fromSTEB(
                      //                     0, 4, 0, 0),
                      //                 child: Text(
                      //                   'Stasoft',
                      //                   textAlign: TextAlign.end,
                      //                   style: TextStyle(
                      //                     fontFamily: 'Lexend Deca',
                      //                     // color: Color(0xFF090F13),
                      //                     fontSize: 12,
                      //                     fontWeight: FontWeight.normal,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
