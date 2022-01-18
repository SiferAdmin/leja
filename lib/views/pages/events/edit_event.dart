import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({Key? key}) : super(key: key);

  @override
  _CreateSalesWidgetState createState() => _CreateSalesWidgetState();
}

class _CreateSalesWidgetState extends State<EditEvent> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  TextEditingController? textController6;
  TextEditingController ? textController7;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController(text: '1');
    textController5 = TextEditingController(text: '0');
    textController6 = TextEditingController();
    textController7 = TextEditingController(text: '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Edit Event',
          style: GoogleFonts.getFont(
            'Lexend Deca',
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
              Text(
                'Product Title',
                style: GoogleFonts.getFont(
                  'Lexend Deca',
                ),
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
                    labelText: 'Product Title',
                    labelStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    hintText: 'Enter Product Title..',
                    hintStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    prefixIcon: const FaIcon(
                      FontAwesomeIcons.productHunt,
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
              Text(
                'Product Category',
                style: GoogleFonts.getFont(
                  'Lexend Deca',
                ),
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
                    labelText: 'Product Category',
                    labelStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    hintText: 'Enter Product Category Title..',
                    hintStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    prefixIcon: const FaIcon(
                      FontAwesomeIcons.objectUngroup,
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
                  keyboardType: TextInputType.name,
                ),
              ),
              const Text(
                'Product Description ',
                
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
                    labelText: 'Product Description',
                    labelStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    hintText: 'Enter Product Description...',
                    hintStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    prefixIcon: const FaIcon(
                      FontAwesomeIcons.info,
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
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                ),
              ),
              Text(
                'Product Price',
                style: GoogleFonts.getFont(
                  'Lexend Deca',
                ),
              ),
              Container(
                width: 100,
                height: 20,
                decoration: const BoxDecoration(),
              ),
              Text(
                'Product Units Sold',
                style: GoogleFonts.getFont(
                  'Lexend Deca',
                ),
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
                    labelText: 'Product Units',
                    labelStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    hintText: 'Enter Product Units Sold...',
                    hintStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    prefixIcon: const FaIcon(
                      FontAwesomeIcons.database,
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
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(
                'Product Discount',
                style: GoogleFonts.getFont(
                  'Lexend Deca',
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'textController5',
                    const Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  controller: textController5,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Product Discount',
                    labelStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    hintText: 'Enter Product Discount...',
                    hintStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    prefixIcon: const FaIcon(
                      FontAwesomeIcons.codiepie,
                    ),
                    suffixIcon: textController5!.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => textController5!.clear(),
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
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(
                'Product Buyer Title',
                style: GoogleFonts.getFont(
                  'Lexend Deca',
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'textController6',
                    const Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  controller: textController6,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Product Buyer Title',
                    labelStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    hintText: 'Enter Product Buyer Title..',
                    hintStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    prefixIcon: const FaIcon(
                      FontAwesomeIcons.users,
                    ),
                    suffixIcon: textController6!.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => textController6!.clear(),
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
              Text(
                'Sale Time & Date',
                style: GoogleFonts.getFont(
                  'Lexend Deca',
                ),
              ),
              Container(
                width: 100,
                height: 20,
                decoration: const BoxDecoration(),
              ),
              Text(
                'Amount Paid',
                style: GoogleFonts.getFont(
                  'Lexend Deca',
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'textController7',
                    const Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  controller: textController7,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Amount Paid',
                    labelStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    hintText: 'Enter Amount Paid...',
                    hintStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    prefixIcon: const FaIcon(
                      FontAwesomeIcons.commentsDollar,
                    ),
                    suffixIcon: textController7!.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => textController7!.clear(),
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
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(
                'Sale Attachments',
                style: GoogleFonts.getFont(
                  'Lexend Deca',
                ),
              ),
              Container(
                width: 100,
                height: 20,
                decoration: const BoxDecoration(),
              ),
              Text(
                'Payment Status',
                style: GoogleFonts.getFont(
                  'Lexend Deca',
                ),
              ),
              Text(
                'Payment Mode',
                style: GoogleFonts.getFont(
                  'Lexend Deca',
                ),
              ),
              Container(
                width: 100,
                height: 20,
                decoration: const BoxDecoration(),
              ),
              ElevatedButton(
                onPressed: () {
                  // print('Button pressed ...');
                },
                child: const Text('Edit Event'),
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
