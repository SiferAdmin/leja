import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leja/main.dart';
import 'package:leja/views/pages/projects/create_project_task.dart';
import 'package:leja/views/pages/projects/edit_project_task.dart';
import 'package:leja/views/pages/projects/view_task.dart';

class TasksDashboard extends StatefulWidget {
  const TasksDashboard({Key? key}) : super(key: key);

  @override
  _ProjectsDashboardState createState() => _ProjectsDashboardState();
}

class _ProjectsDashboardState extends State<TasksDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: Padding(
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
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
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
                            FontAwesomeIcons.balanceScale,
                            color: bright == Brightness.light
                                ? const Color(0xFFF687D4)
                                : Colors.white,
                            size: 24,
                          ),
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
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
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Text(
                          'Open Tasks',
                          // style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.balanceScaleLeft,
                            color: Colors.green,
                            size: 24,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
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
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Text(
                          'Closed Tasks',
                          // style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.balanceScaleRight,
                            color: Colors.pink,
                            size: 24,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
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
                  onPressed: (context) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EditProjectTask()));
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
                      
                    },
                    // print('SlidableActionWidget pressed ...');

                    ),
              ]),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ViewTask()));
                },
                title: const Text(
                  'Task 1',
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CreateProjectTask()));
        },
        // backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        label: Row(
          mainAxisSize: MainAxisSize.max,
          children: const [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
              child: Icon(
                FontAwesomeIcons.briefcaseMedical,
                color: Colors.white,
                size: 24,
              ),
            ),
            Text(
              'Create Task',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    ));
  }
}
