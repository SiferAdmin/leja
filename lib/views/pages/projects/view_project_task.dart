import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leja/main.dart';

class ProjectsDashboardCopyWidget extends StatefulWidget {
  const ProjectsDashboardCopyWidget({Key? key}) : super(key: key);

  @override
  _ProjectsDashboardCopyWidgetState createState() =>
      _ProjectsDashboardCopyWidgetState();
}

class _ProjectsDashboardCopyWidgetState
    extends State<ProjectsDashboardCopyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        // backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: const Text(
          'Tasks',
          // style: FlutterFlowTheme.bodyText1,
        ),
        actions: const [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // print('FloatingActionButton pressed ...');
        },
        // backgroundColor: FlutterFlowTheme.primaryColor,
        icon: FaIcon(
          FontAwesomeIcons.tag,
          color: bright == Brightness.light
              ? const Color(0xFFF687D4)
              : Colors.white,
        ),
        elevation: 8,
        label: const Text(
          'Create Task',
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
                    color: const Color(0xFFF5F5F5),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Text(
                            'All \nTasks',
                            // style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.alignLeft,
                              color: bright == Brightness.light
                                  ? const Color(0xFFF687D4)
                                  : Colors.white,
                              size: 24,
                            ),
                            const Padding(
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
                    color: const Color(0xFFF5F5F5),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Text(
                            'Open \nTasks',
                            // style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.outdent,
                              color: bright == Brightness.light
                                  ? const Color(0xFFF687D4)
                                  : Colors.white,
                              size: 24,
                            ),
                            const Padding(
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
                    color: const Color(0xFFF5F5F5),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Text(
                            'Closed Tasks',
                            // style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.clipboardList,
                              color: bright == Brightness.light
                                  ? const Color(0xFFF687D4)
                                  : Colors.white,
                              size: 24,
                            ),
                            const Padding(
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
              // Slidable(
              //   // actionPane: const SlidableScrollActionPane(),
              //   secondaryActions: [
              //     IconSlideAction(
              //       caption: 'Edit',
              //       color: Colors.blue,
              //       icon: FontAwesomeIcons.solidEdit,
              //       onTap: () {
              //         // print('SlidableActionWidget pressed ...');
              //       },
              //     ),
              //     IconSlideAction(
              //       caption: 'Close',
              //       color: Colors.blue,
              //       icon: FontAwesomeIcons.doorClosed,
              //       onTap: () {
              //         // print('SlidableActionWidget pressed ...');
              //       },
              //     ),
              //   ],
              //   child: const ListTile(
              //     title: Text(
              //       'Task 1',
              //       // style: FlutterFlowTheme.title3,
              //     ),
              //     subtitle: Text(
              //       'Collect the materials',
              //       // style: FlutterFlowTheme.subtitle2,
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
