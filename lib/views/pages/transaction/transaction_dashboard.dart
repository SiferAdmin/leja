import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leja/main.dart';
import 'package:leja/views/pages/transaction/create_transaction.dart';
import 'package:leja/views/pages/transaction/edit_transaction.dart';
import 'package:leja/views/pages/transaction/view_transaction.dart';

class TramsactionDashboardWidget extends StatefulWidget {
  const TramsactionDashboardWidget({Key? key}) : super(key: key);

  @override
  _TramsactionDashboardWidgetState createState() =>
      _TramsactionDashboardWidgetState();
}

class _TramsactionDashboardWidgetState
    extends State<TramsactionDashboardWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Transaction',
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
           Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => const CreateTransaction()))
                .then((value) {
             
            });
        },
        icon: const FaIcon(
          FontAwesomeIcons.chargingStation,
        ),
        elevation: 8,
        label: const Text(
          'Create Transaction',
          // style: FlutterFlowTheme.bodyText1,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              GridView(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: Text(
                            'All \nTransactions',
                            // style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                        // const Spacer(flex: 1),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.dollyFlatbed,
                              // color: Colors.black,
                              size: 24,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Text(
                                '1',
                                // style: FlutterFlowTheme.bodyText1,
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Text(
                            'Income',
                            // style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.dolly,
                              // color: Colors.black,
                              size: 24,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Text(
                                '2',
                                // style: FlutterFlowTheme.bodyText1,
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Text(
                            'Expenses',
                            // style: FlutterFlowTheme.bodyText1,
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
                                // style: FlutterFlowTheme.bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Slidable(
              // endActionPane: const ActionPane(
              //   motion: ScrollMotion(),
              //   children: [
              //     SlidableAction(
              //       // An action can be bigger than the others.
              //       flex: 2,
              //       onPressed: null,
              //       backgroundColor: Color(0xFF7BC043),
              //       foregroundColor: Colors.white,
              //       icon: Icons.archive,
              //       label: 'Archive',
              //     ),
              //     SlidableAction(
              //       onPressed: null,
              //       backgroundColor: Color(0xFF0392CF),
              //       foregroundColor: Colors.white,
              //       icon: Icons.save,
              //       label: 'Save',
              //     ),
              //   ],
              // ),
              endActionPane:
                  ActionPane(motion: const ScrollMotion(), children: [
                SlidableAction(
                  label: 'Edit',
                  foregroundColor: bright == Brightness.light
                      ? const Color(0xFFF687D4)
                      : Colors.pink,
                  backgroundColor:
                      bright == Brightness.light ? Colors.white : Colors.black,
                  autoClose: true,
                  // color: Colors.blue,
                  icon: FontAwesomeIcons.solidEdit,
                  onPressed:(context) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EditTransaction()));
                  },
                ),
                SlidableAction(
                    label: 'Close',
                    foregroundColor: bright == Brightness.light
                        ? const Color(0xFFF687D4)
                        : Colors.pink,
                    backgroundColor: bright == Brightness.light
                        ? Colors.white
                        : Colors.black,
                    autoClose: true,
                    // color: Colors.blue,
                    icon: FontAwesomeIcons.doorClosed,
                    onPressed: (context) {
                    
                  }
                    // print('SlidableActionWidget pressed ...');

                    ),
              ]),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TransactionViewWidget()));
                },
                title: const Text(
                  'Transaction 1',
                  // style: FlutterFlowTheme.title3,
                ),
                subtitle: const Text(
                  'Creating a new structure',
                  // style: FlutterFlowTheme.subtitle2,
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.solidEye,
                  color: bright == Brightness.light
                      ? const Color(0xFFF687D4)
                      : Colors.pink,
                  size: 20,
                ),
                // tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
          
              // Slidable(
              //   actionPane: const SlidableScrollActionPane(),
              //   secondaryActions: [
              //     IconSlideAction(
              //       caption: 'Edit',
              //       color: Colors.blue,
              //       icon: FontAwesomeIcons.solidEdit,
              //       onTap: () {
              //         print('SlidableActionWidget pressed ...');
              //       },
              //     ),
              //     IconSlideAction(
              //       caption: 'Close',
              //       color: Colors.blue,
              //       icon: FontAwesomeIcons.doorClosed,
              //       onTap: () {
              //         print('SlidableActionWidget pressed ...');
              //       },
              //     ),
              //   ],
              //   child: ListTile(
              //     title: Text(
              //       'Transaction 1',
              //       style: FlutterFlowTheme.title3,
              //     ),
              //     subtitle: Text(
              //       'Collect the materials',
              //       style: FlutterFlowTheme.subtitle2,
              //     ),
              //     trailing: FaIcon(
              //       FontAwesomeIcons.solidEye,
              //       color: Color(0xFF303030),
              //       size: 20,
              //     ),
              //     tileColor: Color(0xFFF5F5F5),
              //     dense: false,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
