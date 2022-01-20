
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leja/views/pages/sales/edit_sales.dart';

class SalesViewWidget extends StatefulWidget {
  const SalesViewWidget({Key? key}) : super(key: key);

  @override
  _SalesViewWidgetState createState() => _SalesViewWidgetState();
}

class _SalesViewWidgetState extends State<SalesViewWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        // backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: const Text(
          'Sale View',
         
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
                      builder: (context) => const EditSales()))
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
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
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
                    'Product Title',
                   
                  ),
                  const Text(
                    'Project --',
                   
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Product Description',
                   
                  ),
                  Text(
                    'Project --',
                   
                  ),
                ],
              ),
              const Text(
                'Product Category',
               
              ),
              const Text(
                'Project --',
               
              ),
              const Text(
                'Product Price',
               
              ),
              const Text(
                'Project --',
               
              ),
              const Text(
                'Sale Date & Time',
               
              ),
              const Text(
                'Project --',
               
              ),
              const Text(
                'Product Units Sold',
               
              ),
              const Text(
                'Project --',
               
              ),
              const Text(
                'Sale Discount',
               
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
                'Amount Paid',
               
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
                'Sale Attachments',
               
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
