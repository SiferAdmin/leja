import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leja/main.dart';
import 'package:leja/views/pages/stocks/create_stock.dart';
import 'package:leja/views/pages/stocks/edit_stock.dart';
import 'package:leja/views/pages/stocks/view_stocks.dart';

class StockDashboardWidget extends StatefulWidget {
  const StockDashboardWidget({Key? key}) : super(key: key);

  @override
  _StockDashboardWidgetState createState() => _StockDashboardWidgetState();
}

class _StockDashboardWidgetState extends State<StockDashboardWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Stocks',
          style: GoogleFonts.getFont(
            'Lexend Deca',
          ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 4,
      ),
      // backgroundColor: Color(0xFFF5F5F5),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // print('FloatingActionButton pressed ...');
           Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => const CreateStockWidget()))
                .then((value) {
             
            });
        },
        icon: const Icon(
          Icons.store,
        ),
        elevation: 8,
        label: const Text(
          'Create Stock',
         
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
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Text(
                            'All \nStocks',
                           
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.hourglassHalf,
                              // color: Colors.black,
                              size: 24,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Text(
                                '1',
                               
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
                            'Open \nStocks',
                           
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.solidHourglass,
                              // color: Colors.black,
                              size: 24,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Text(
                                '2',
                               
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
                            'Closed Stocks',
                           
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.hourglass,
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
                      builder: (context) => const EditStock()));
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
                      builder: (context) => const StockViewWidget()));
                },
                title: const Text(
                  'Stock 1',
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
              //       'Stock 1',
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
