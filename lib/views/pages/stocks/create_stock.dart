import 'package:date_time_picker/date_time_picker.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CreateStockWidget extends StatefulWidget {
  const CreateStockWidget({Key? key}) : super(key: key);

  @override
  _CreateStockWidgetState createState() => _CreateStockWidgetState();
}

class _CreateStockWidgetState extends State<CreateStockWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  int countControllerValue = 1;
  TextEditingController? textController5;
  TextEditingController? textController4;
  TextEditingController? textController6;
  final TextEditingController _controller1 =
      TextEditingController(text: DateTime.now().toString());
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String dropDownValue1 = 'Select Item Condition';
  String valueChanged1 = '';

  DateTime selectedDate = DateTime.now();

  DateFormat format = DateFormat("dd.MM.yyyy");
  String valueToValidate1 = '';

  String valueSaved1 = '';

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    textController6 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Create Stock',
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
                'Item Title',
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
                    labelText: 'Item Title',
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
                'Item Description',
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
                    labelText: 'Item Description',
                    labelStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    hintText: 'Enter Item Description..',
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
                'Item Category',
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
                'Item Quantity',
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'quantityController',
                    const Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  controller: textController4,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Item Quantity',
                    labelStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    hintText: 'Enter Item quantity..',
                    hintStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    prefixIcon: const FaIcon(
                      FontAwesomeIcons.adjust,
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

              const Text(
                'Item Purchase Date',
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

              const Text(
                'Item Purchase Price',
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
                    labelText: 'Item Price',
                    labelStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                    ),
                    hintText: 'Enter Item price..',
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

              Container(
                width: 100,
                height: 20,
                decoration: const BoxDecoration(),
              ),
              const Text(
                'Item Purchased From',
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

              // const Text(
              //   'Item Photo',
              // ),
              Container(
                width: 100,
                height: 20,
                decoration: const BoxDecoration(),
              ),
              const Text(
                'Item Condition',
              ),
              DropdownButton(
                items: <String>[
                  'New',
                  'Available',
                  'Good',
                  'Bad',
                  'Running Out',
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
              ElevatedButton(
                onPressed: () {
                  // print('Button pressed ...');
                  Navigator.pop(context);
                },
                child: const Text('Create Stock'),
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
