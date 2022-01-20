import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leja/views/pages/transaction/edit_transaction.dart';

class TransactionViewWidget extends StatefulWidget {
  const TransactionViewWidget({Key? key}) : super(key: key);

  @override
  _TransactionViewWidgetState createState() => _TransactionViewWidgetState();
}

class _TransactionViewWidgetState extends State<TransactionViewWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        // backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title:const Padding(
          padding:  EdgeInsets.all(8.0),
          child: Center(
            child:  Text(
              'Transaction \nView', style: TextStyle(fontSize: 24),
              //
            ),
          ),
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
                      builder: (context) => const EditTransaction()))
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
                    'Transaction Title',
                    //
                  ),
                  const Text(
                    'Project --',
                    //
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Transaction Description',
                  ),
                  Text(
                    'Project --',
                  ),
                ],
              ),
              const Text(
                'Transaction Category',
              ),
              const Text(
                'Project --',
              ),
              const Text(
                'Transaction Cost',
              ),
              const Text(
                'Project --',
              ),
              const Text(
                'Transaction Date & Time',
              ),
              const Text(
                'Project --',
              ),
              const Text(
                'Transaction Units ',
              ),
              const Text(
                'Project --',
              ),
              const Text(
                'Transaction Party',
              ),
              const Text(
                'Project --',
              ),
              const Text(
                'Product Buyer Title',
              ),
              const Text(
                'Project --',
              ),
              const Text(
                'Payment Status',
              ),
              const Text(
                'Project --',
              ),
              const Text(
                'Paymet Mode',
              ),
              const Text(
                'Project --',
              ),
              const Text(
                'Total Amount',
              ),
              const Text(
                'Project --',
              ),
              const Text(
                'Pending Balance',
              ),
              const Text(
                'Project --',
              ),
              const Text(
                'Transaction Attachments',
              ),
              const Text(
                'Project --',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
