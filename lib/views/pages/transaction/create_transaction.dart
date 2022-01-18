import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTransaction extends StatefulWidget {
  const CreateTransaction({Key? key}) : super(key: key);

  @override
  _CreateExpenseWidgetState createState() => _CreateExpenseWidgetState();
}

class _CreateExpenseWidgetState extends State<CreateTransaction> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  int countControllerValue = 1;
  TextEditingController? textController4;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Create Transaction',
          style: GoogleFonts.getFont(
            'Lexend Deca',
            fontSize: 24,
          ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              const Text(
                'Transaction Title',
                // style: FlutterFlowTheme.bodyText1,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'textController1',
                    const Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  controller: textController1,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Item Transaction',
                    labelStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    hintText: 'Enter Item Title..',
                    hintStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.title,
                    ),
                    suffixIcon: textController1!.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => textController1!.clear(),
                            ),
                            child: const Icon(
                              Icons.clear,
                              color: Color(0xFF757575),
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: GoogleFonts.getFont(
                    'Lexend Deca',
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              const Text(
                'Transaction Description',
                // style: FlutterFlowTheme.bodyText1,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'textController2',
                    const Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  controller: textController2,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Transaction Description',
                    labelStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    hintText: 'Enter Transaction Description..',
                    hintStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    prefixIcon: const FaIcon(
                      FontAwesomeIcons.infoCircle,
                    ),
                    suffixIcon: textController2!.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => textController2!.clear(),
                            ),
                            child: const Icon(
                              Icons.clear,
                              color: Color(0xFF757575),
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: GoogleFonts.getFont(
                    'Lexend Deca',
                  ),
                  keyboardType: TextInputType.multiline,
                ),
              ),
              const Text(
                'Transaction Category',
                // style: FlutterFlowTheme.bodyText1,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'textController3',
                    const Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  controller: textController3,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Item Category',
                    labelStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    hintText: 'Enter Item Category..',
                    hintStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    prefixIcon: const FaIcon(
                      FontAwesomeIcons.layerGroup,
                    ),
                    suffixIcon: textController3!.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => textController3!.clear(),
                            ),
                            child: const Icon(
                              Icons.clear,
                              color: Color(0xFF757575),
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: GoogleFonts.getFont(
                    'Lexend Deca',
                  ),
                ),
              ),
              const Text(
                'Transaction Units',
                // style: FlutterFlowTheme.bodyText1,
              ),
              // Padding(
              //   padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
              //   child: Container(
              //     width: 160,
              //     height: 50,
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //         colors: [Colors.red, Color(0xFF46FF00)],
              //         stops: [0, 1],
              //         begin: AlignmentDirectional(-1, 0),
              //         end: AlignmentDirectional(1, 0),
              //       ),
              //       borderRadius: BorderRadius.circular(25),
              //       shape: BoxShape.rectangle,
              //       border: Border.all(
              //         width: 1,
              //       ),
              //     ),
              //     child: FlutterFlowCountController(
              //       decrementIconBuilder: (enabled) => FaIcon(
              //         FontAwesomeIcons.minus,
              //         color: enabled ? Color(0xDD950F0F) : Color(0xFFEEEEEE),
              //         size: 20,
              //       ),
              //       incrementIconBuilder: (enabled) => FaIcon(
              //         FontAwesomeIcons.plus,
              //         color: enabled ? Colors.green : Color(0xFFEEEEEE),
              //         size: 20,
              //       ),
              //       countBuilder: (count) => Text(
              //         count.toString(),
              //         style: GoogleFonts.getFont(
              //           'Lexend Deca',
              //           color: Colors.green,
              //           fontWeight: FontWeight.w600,
              //           fontSize: 16,
              //         ),
              //       ),
              //       count: countControllerValue ??= 1,
              //       updateCount: (count) =>
              //           setState(() => countControllerValue = count),
              //       stepSize: 1,
              //       minimum: 1,
              //     ),
              //   ),
              // ),

              const Text(
                'Transaction Date',
                // style: FlutterFlowTheme.bodyText1,
              ),
              Container(
                width: 100,
                height: 20,
                decoration: const BoxDecoration(),
              ),
              const Text(
                'Transaction Cost',
                // style: FlutterFlowTheme.bodyText1,
              ),
              Container(
                width: 100,
                height: 20,
                decoration: const BoxDecoration(),
              ),
              const Text(
                'Transacion Party',
                // style: FlutterFlowTheme.bodyText1,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'textController4',
                    const Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  controller: textController4,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Item Purchace Source',
                    labelStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    hintText: 'Enter Item Purchase Source..',
                    hintStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    prefixIcon: const FaIcon(
                      FontAwesomeIcons.store,
                    ),
                    suffixIcon: textController4!.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => textController4!.clear(),
                            ),
                            child: const Icon(
                              Icons.clear,
                              color: Color(0xFF757575),
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: GoogleFonts.getFont(
                    'Lexend Deca',
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              const Text(
                'Transaction Attachments',
                // style: FlutterFlowTheme.bodyText1,
              ),
              Container(
                width: 100,
                height: 20,
                decoration: const BoxDecoration(),
              ),
              const Text(
                'Transaction Status',
                // style: FlutterFlowTheme.bodyText1,
              ),
              Container(
                width: 100,
                height: 20,
                decoration: const BoxDecoration(),
              ),
              ElevatedButton(
                onPressed: () {
                  // print('Button pressed ...');
                  Navigator.pop(context);
                },
                child: const Text('Create Transaction'),
                // options: FFButtonOptions(
                //   width: 130,
                //   height: 40,
                //   color: FlutterFlowTheme.primaryColor,
                //   textStyle: GoogleFonts.getFont(
                //     'Lexend Deca',
                //     color: Colors.white,
                //   ),
                //   borderSide: BorderSide(
                //     color: Colors.transparent,
                //     width: 1,
                //   ),
                //   borderRadius: 12,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
