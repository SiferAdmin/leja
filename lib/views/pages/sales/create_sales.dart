import 'package:date_time_picker/date_time_picker.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateSalesWidget extends StatefulWidget {
  const CreateSalesWidget({Key? key}) : super(key: key);

  @override
  _CreateSalesWidgetState createState() => _CreateSalesWidgetState();
}

class _CreateSalesWidgetState extends State<CreateSalesWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  TextEditingController? textController6;
  TextEditingController? textController7;
  String dropDownValue1 = 'Select Payment Status';
  String dropDownValue2 = 'Select Payment Mode';
    String valueChanged1 = '';
    final TextEditingController _controller1 =
      TextEditingController(text: DateTime.now().toString());

  DateTime selectedDate = DateTime.now();

  DateFormat format = DateFormat("dd.MM.yyyy");
  String valueToValidate1 = '';

  String valueSaved1 = '';
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
          'Create Sale',
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'priceController',
                    const Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  controller: textController4,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Product Price',
                    labelStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    hintText: 'Enter Product price..',
                    hintStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    prefixIcon: const FaIcon(
                      FontAwesomeIcons.adjust,
                    ),
                    suffixIcon: textController5!.text.isNotEmpty
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
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
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
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  dateMask: 'd MMM, yyyy',
                  controller: _controller1,

                  // initialValue: 'q',
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100), initialDate: selectedDate,
                  icon: const Icon(Icons.event),
                  dateLabelText: 'Date',
                  timeLabelText: "Hour",
                  use24HourFormat: false,
                  //locale: Locale('pt', 'BR'),
                  // selectableDayPredicate: (date) {
                  //   if (date.weekday == 6 || date.weekday == 7) {
                  //     return false;
                  //   }
                  //   return true;
                  // },
                  onChanged: (val) => setState(() => valueChanged1 = val),
                  validator: (val) {
                    setState(() => valueToValidate1 = val ?? '');
                    // setState(() => newDate = DateTime.parse(val!));
                    return null;
                  },
                  onSaved: (val) => setState(() => valueSaved1 = val ?? ''),
                ),
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
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
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
              // Text(
              //   'Sale Attachments',
              //   style: GoogleFonts.getFont(
              //     'Lexend Deca',
              //   ),
              // ),
              // Container(
              //   width: 100,
              //   height: 20,
              //   decoration: const BoxDecoration(),
              // ),
              Text(
                'Payment Status',
                style: GoogleFonts.getFont(
                  'Lexend Deca',
                ),
              ),
              DropdownButton(
                items: <String>[
                  'Complete',
                  'Pending',
                  'Refunded',
                  'Failed',
                  'Abandoled',
                  'Revoked',
                  'Cancelled',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: Text(dropDownValue1),
                onChanged: (val) =>
                    setState(() => dropDownValue1 = val.toString()),
                elevation: 2,
                // value: dropDownValue1,
              ),
              Text(
                'Payment Mode',
                style: GoogleFonts.getFont(
                  'Lexend Deca',
                ),
              ),
              DropdownButton(
                items: <String>[
                  'Cash',
                  'Checks',
                  'Mpesa',
                  'Bank Transfer',
                  'Barter',
                  'Other',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: Text(dropDownValue2),
                onChanged: (val) =>
                    setState(() => dropDownValue2 = val.toString()),
                elevation: 2,
                // value: dropDownValue1,
              ),
              ElevatedButton(
                onPressed: () {
                  // print('Button pressed ...');
                  Navigator.pop(context);
                },
                child: const Text('Create Sale'),
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
