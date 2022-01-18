import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leja/views/pages/projects/edit_project.dart';

class ViewProject extends StatefulWidget {
  const ViewProject({Key? key}) : super(key: key);

  @override
  _ProjectViewWidgetState createState() => _ProjectViewWidgetState();
}

class _ProjectViewWidgetState extends State<ViewProject> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        // backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: const Text(
          'Project View',
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
            // borderColor: Colors.transparent,
            // borderRadius: 30,
            // borderWidth: 1,
            // buttonSize: 60,
            icon: const FaIcon(
              FontAwesomeIcons.edit,
              // color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (context) => const EditProject()))
                  .then((value) {});
            },
          ),
          IconButton(
            // borderColor: Colors.transparent,
            // borderRadius: 30,
            // borderWidth: 1,
            // buttonSize: 60,
            icon: const Icon(
              Icons.delete_forever_outlined,
              // color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      // backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 12,
                        shape: const CircleBorder(),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.red, Color(0xFFFFFF00)],
                              stops: [1, 1],
                              begin: AlignmentDirectional(0.1, -1),
                              end: AlignmentDirectional(-0.1, 1),
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF9E9E9E),
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Project Title',
                    // style: FlutterFlowTheme.bodyText1,
                  ),
                  const Text(
                    'Project --',
                    // style: FlutterFlowTheme.bodyText1,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Project Description/Goals',
                    // style: FlutterFlowTheme.bodyText1,
                  ),
                  Text(
                    'Project --',
                    // style: FlutterFlowTheme.bodyText1,
                  ),
                ],
              ),
              const Text(
                'Project Category',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project --',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project Status',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project --',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project Priority',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project --',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project Cost/Budget',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project --',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project Creating Date',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project --',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project Deadline',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project --',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project Start Date ',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project --',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project End Date',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project --',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project Labels',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project --',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project Attachments, Documents & Pictures',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project --',
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Project Tasks',
                // style: FlutterFlowTheme.bodyText1,
              ),
              Container(
                width: 100,
                height: 20,
                decoration: const BoxDecoration(),
              ),
              const Text(
                'Project Assignees',
                // style: FlutterFlowTheme.bodyText1,
              ),
              Container(
                width: 100,
                height: 20,
                decoration: const BoxDecoration(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
