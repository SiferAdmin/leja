import 'package:date_time_picker/date_time_picker.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:leja/main.dart';
import 'package:leja/services/date/utils.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<CreateProject> {
  late String dropDownValue1 = 'Select Category';
  late TextEditingController textController1;
  late TextEditingController textController2;
  late String dropDownValue2 = 'Select Status';
  late String dropDownValue3 = 'Select Priority';
  late TextEditingController textController3;
  double sliderValue = 0;
  late TextEditingController textController4;
  late TextEditingController textController5;
  late DateTime fromDate;
  late DateTime toDate;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _controller1 =
      TextEditingController(text: DateTime.now().toString());
  // ignore: unused_field
  late TextEditingController _controller2;
  // ignore: unused_field
  late TextEditingController _controller3;
  // ignore: unused_field
  String _valueToValidate1 = '';
  // ignore: unused_field
  String _valueSaved1 = '';
  // ignore: unused_field
  final DateTime _initialValue = DateTime.now();
  late final DateTime newDate;
  bool isChecked = false;
  String valueChanged1 = '';

  DateTime selectedDate = DateTime.now();

  DateFormat format = DateFormat("dd.MM.yyyy");

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    _controller1 = TextEditingController(text: DateTime.now().toString());

    fromDate = DateTime.now();
    toDate = DateTime.now().add(const Duration(hours: 2));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          // backgroundColor: FlutterFlowTheme.primaryColor,
          automaticallyImplyLeading: true,
          title: const Text(
            'Create New Project',
            style: TextStyle(fontSize: 24),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 4,
        ),
        // backgroundColor: const Color(0xFFF5F5F5),
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: ListView(
            // mainAxisSize: MainAxisSize.max,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Project Title',
                // style: FlutterFlowTheme.bodyText1,
              ),
              TextFormField(
                onChanged: (_) => EasyDebounce.debounce(
                  'textController1',
                  const Duration(milliseconds: 2000),
                  () => setState(() {}),
                ),
                controller: textController1,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Project Title',
                  // labelStyle: FlutterFlowTheme.bodyText1,
                  hintText: 'Type your Project title here...',
                  // hintStyle: FlutterFlowTheme.bodyText1,
                  // enabledBorder: const UnderlineInputBorder(
                  //   borderSide: BorderSide(
                  //     // color: Color(0x00000000),
                  //     width: 1,
                  //   ),
                  //   borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(4.0),
                  //     topRight: Radius.circular(4.0),
                  //   ),
                  // ),
                  // focusedBorder: const UnderlineInputBorder(
                  //   borderSide: BorderSide(
                  //     // color: Color(0x00000000),
                  //     width: 1,
                  //   ),
                  //   borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(4.0),
                  //     topRight: Radius.circular(4.0),
                  //   ),
                  // ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.blackTie,
                      color: bright == Brightness.light
                          ? const Color(0xFFF687D4)
                          : Colors.pink,
                    ),
                  ),
                  suffixIcon: textController1.text.isNotEmpty
                      ? InkWell(
                          onTap: () => setState(
                            () => textController1.clear(),
                          ),
                          child: const Icon(
                            Icons.clear,
                            // color: Color(0xFF757575),
                            size: 22,
                          ),
                        )
                      : null,
                ),
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Brief Description/Goals',
                // style: FlutterFlowTheme.bodyText1,
              ),
              TextFormField(
                onChanged: (_) => EasyDebounce.debounce(
                  'textController2',
                  const Duration(milliseconds: 2000),
                  () => setState(() {}),
                ),
                controller: textController2,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Project Description',
                  // labelStyle: FlutterFlowTheme.bodyText1,
                  hintText: 'Type your Project description here...',
                  // hintStyle: FlutterFlowTheme.bodyText1,
                  // enabledBorder: const UnderlineInputBorder(
                  //   borderSide: BorderSide(
                  //     // color: Color(0x00000000),
                  //     width: 1,
                  //   ),
                  //   borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(4.0),
                  //     topRight: Radius.circular(4.0),
                  //   ),
                  // ),
                  // focusedBorder: const UnderlineInputBorder(
                  //   borderSide: BorderSide(
                  //     // color: Color(0x00000000),
                  //     width: 1,
                  //   ),
                  //   borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(4.0),
                  //     topRight: Radius.circular(4.0),
                  //   ),
                  // ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.binoculars,
                      color: bright == Brightness.light
                          ? const Color(0xFFF687D4)
                          : Colors.pink,
                    ),
                  ),
                  suffixIcon: textController2.text.isNotEmpty
                      ? InkWell(
                          onTap: () => setState(
                            () => textController2.clear(),
                          ),
                          child: const Icon(
                            Icons.clear,
                            // color: Color(0xFF757575),
                            size: 22,
                          ),
                        )
                      : null,
                ),
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Category',
                // style: FlutterFlowTheme.bodyText1,
              ),

              DropdownButton(
                items: <String>[
                  'Family',
                  'Business',
                  'Health',
                  'Home',
                  'Children',
                  'Leisure',
                  'Productivity'
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
              const Text(
                'Status',
                // style: FlutterFlowTheme.bodyText1,
              ),
              DropdownButton(
                items: <String>[
                  'Active',
                  'Inactive',
                  'SomeDay/Maybe',
                  'Finished',
                  'Dropped'
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
                // value: dropDownValue2,
              ),
              // FlutterFlowDropDown(
              //   options: [
              //     'Active',
              //     'Inactive',
              //     'SomeDay/Maybe',
              //     'Finished',
              //     'Dropped'
              //   ].toList(),
              //   onChanged: (val) => setState(() => dropDownValue2 = val),
              //   width: 180,
              //   height: 50,
              //   textStyle: FlutterFlowTheme.bodyText1.override(
              //     fontFamily: 'Poppins',
              //     color: Colors.black,
              //   ),
              //   icon: FaIcon(
              //     FontAwesomeIcons.biking,
              //     color: Colors.green,
              //   ),
              //   fillColor: Colors.white,
              //   elevation: 2,
              //   borderColor: Colors.transparent,
              //   borderWidth: 0,
              //   borderRadius: 0,
              //   margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              //   hidesUnderline: true,
              // ),
              const Text(
                'Priority',
                // style: FlutterFlowTheme.bodyText1,
              ),
              DropdownButton(
                items: <String>['High', 'Normal', 'Low', 'None']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: Text(dropDownValue3),
                onChanged: (val) =>
                    setState(() => dropDownValue3 = val.toString()),
                elevation: 2,
                // value: dropDownValue3,
              ),
              // FlutterFlowDropDown(
              //   options: ['High', 'Normal', 'Low', 'None'].toList(),
              //   onChanged: (val) => setState(() => dropDownValue3 = val),
              //   width: 180,
              //   height: 50,
              //   textStyle: FlutterFlowTheme.bodyText1.override(
              //     fontFamily: 'Poppins',
              //     color: Colors.black,
              //   ),
              //   icon: FaIcon(
              //     FontAwesomeIcons.temperatureHigh,
              //   ),
              //   fillColor: Colors.white,
              //   elevation: 2,
              //   borderColor: Colors.transparent,
              //   borderWidth: 0,
              //   borderRadius: 0,
              //   margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              //   hidesUnderline: true,
              // ),
              const Text(
                'Cost/Budget',
                // style: FlutterFlowTheme.bodyText1,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Text(
                      'KSH',
                      // style: FlutterFlowTheme.bodyText1,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      onChanged: (_) => EasyDebounce.debounce(
                        'textController3',
                        const Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      controller: textController3,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Enter the Amount',
                        // hintStyle: FlutterFlowTheme.bodyText1,
                        // enabledBorder: const UnderlineInputBorder(
                        //   borderSide: BorderSide(
                        //     // color: Color(0x00000000),
                        //     width: 1,
                        //   ),
                        //   borderRadius: BorderRadius.only(
                        //     topLeft: Radius.circular(4.0),
                        //     topRight: Radius.circular(4.0),
                        //   ),
                        // ),
                        // focusedBorder: const UnderlineInputBorder(
                        //   borderSide: BorderSide(
                        //     // color: Color(0x00000000),
                        //     width: 1,
                        //   ),
                        //   borderRadius: BorderRadius.only(
                        //     topLeft: Radius.circular(4.0),
                        //     topRight: Radius.circular(4.0),
                        //   ),
                        // ),
                        suffixIcon: textController3.text.isNotEmpty
                            ? InkWell(
                                onTap: () => setState(
                                  () => textController3.clear(),
                                ),
                                child: const Icon(
                                  Icons.clear,
                                  // color: Color(0xFF757575),
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      // style: FlutterFlowTheme.bodyText1,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  // FlutterFlowIconButton(
                  //   borderColor: Colors.transparent,
                  //   borderRadius: 30,
                  //   borderWidth: 1,
                  //   buttonSize: 60,
                  //   icon: FaIcon(
                  //     FontAwesomeIcons.calculator,
                  //     color: Colors.black,
                  //     size: 30,
                  //   ),
                  //   onPressed: () {
                  //     print('IconButton pressed ...');
                  //   },
                  // ),
                ],
              ),

              // Padding(
              //   padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     children: [
              //       const Text(
              //         '4',
              //         // style: FlutterFlowTheme.bodyText1,
              //       ),
              //       IconButton(
              //         // borderColor: Colors.transparent,
              //         // borderRadius: 30,
              //         // borderWidth: 1,
              //         // buttonSize: 60,
              //         icon: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: FaIcon(
              //             FontAwesomeIcons.handHoldingWater,
              //             color: bright == Brightness.light
              //                 ? const Color(0xFFF687D4)
              //                 : Colors.pink,
              //             size: 30,
              //           ),
              //         ),
              //         onPressed: () {
              //           // print('IconButton pressed ...');
              //           Navigator.of(context).push(MaterialPageRoute(
              //               builder: (context) => const TasksDashboard()));
              //         },
              //       ),
              //       IconButton(
              //         // borderColor: Colors.transparent,
              //         // borderRadius: 30,
              //         // borderWidth: 1,
              //         // buttonSize: 60,
              //         icon: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: FaIcon(
              //             FontAwesomeIcons.solidPlusSquare,
              //             color: bright == Brightness.light
              //                 ? const Color(0xFFF687D4)
              //                 : Colors.pink,
              //             size: 30,
              //           ),
              //         ),
              //         onPressed: () {
              //           // print('IconButton pressed ...');
              //           Navigator.of(context).push(MaterialPageRoute(
              //               builder: (context) => const CreateProjectTask()));
              //         },
              //       ),
              //     ],
              //   ),
              // ),

              const Text(
                'Start Date & Time',
                // style: FlutterFlowTheme.bodyText1,
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
                    setState(() => _valueToValidate1 = val ?? '');
                    // setState(() => newDate = DateTime.parse(val!));
                    return null;
                  },
                  onSaved: (val) => setState(() => _valueSaved1 = val ?? ''),
                ),
              ),

              const Text(
                'Deadline',
                // style: FlutterFlowTheme.bodyText1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  dateMask: 'd MMM, yyyy',
                  controller: _controller1,
                  // initialValue: 'q',
                  firstDate: selectedDate,
                  lastDate: DateTime(2100),
                  initialDate: selectedDate,
                  icon: const Icon(Icons.event),
                  dateLabelText: 'Date',
                  timeLabelText: "Hour",
                  use24HourFormat: false,
                  //locale: Locale('pt', 'BR'),
                  // selectableDayPredicate: (date) {
                  //   if (date.isAfter(selectedDate)||date.isBefore(DateTime(2050))) {
                  //     return false;
                  //   }
                  //   return true;
                  // },

                  onChanged: (val) => setState(() => valueChanged1 = val),
                  validator: (val) {
                    setState(() => _valueToValidate1 = val ?? '');
                    return null;
                  },
                  onSaved: (val) => setState(() => _valueSaved1 = val ?? ''),
                ),
              ),
              const Text(
                'Progress',
                // style: FlutterFlowTheme.bodyText1,
              ),
              Slider(
                // activeColor: FlutterFlowTheme.primaryColor,
                inactiveColor: const Color(0xFF9E9E9E),
                min: 0,
                max: 100,
                value: sliderValue,
                label: sliderValue.toString(),
                divisions: 20,
                onChanged: (newValue) {
                  setState(() => sliderValue = newValue);
                },
              ),
              // const Text(
              //   'Attachments/Documents & Pictures',
              //   // style: FlutterFlowTheme.bodyText1,
              // ),
              // Row(
              //   mainAxisSize: MainAxisSize.max,
              //   children: [
              //     IconButton(
              //       // borderColor: Colors.transparent,
              //       // borderRadius: 30,
              //       // borderWidth: 1,
              //       // buttonSize: 60,
              //       icon: Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: FaIcon(
              //           FontAwesomeIcons.artstation,
              //           color: bright == Brightness.light
              //               ? const Color(0xFFF687D4)
              //               : Colors.pink,
              //           size: 30,
              //         ),
              //       ),
              //       onPressed: () {
              //         // print('IconButton pressed ...');
              //       },
              //     ),
              //     IconButton(
              //       // borderColor: Colors.transparent,
              //       // borderRadius: 30,
              //       // borderWidth: 1,
              //       // buttonSize: 60,
              //       icon: Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: FaIcon(
              //           FontAwesomeIcons.cameraRetro,
              //           color: bright == Brightness.light
              //               ? const Color(0xFFF687D4)
              //               : Colors.pink,
              //           size: 30,
              //         ),
              //       ),
              //       onPressed: () {
              //         // print('IconButton pressed ...');
              //       },
              //     ),
              //   ],
              // ),

              const Text(
                'Assigned To',
                // style: FlutterFlowTheme.bodyText1,
              ),
              TextFormField(
                onChanged: (_) => EasyDebounce.debounce(
                  'textController4',
                  const Duration(milliseconds: 2000),
                  () => setState(() {}),
                ),
                controller: textController4,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Project Assignees',
                  // labelStyle: FlutterFlowTheme.bodyText1,
                  hintText: 'Type your Project assignees here...',
                  // hintStyle: FlutterFlowTheme.bodyText1,
                  // enabledBorder: const UnderlineInputBorder(
                  //   borderSide: BorderSide(
                  //     // color: Color(0x00000000),
                  //     width: 1,
                  //   ),
                  //   borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(4.0),
                  //     topRight: Radius.circular(4.0),
                  //   ),
                  // ),
                  // focusedBorder: const UnderlineInputBorder(
                  //   borderSide: BorderSide(
                  //     // color: Color(0x00000000),
                  //     width: 1,
                  //   ),
                  //   borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(4.0),
                  //     topRight: Radius.circular(4.0),
                  //   ),
                  // ),
                  prefixIcon: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FaIcon(
                        FontAwesomeIcons.handHoldingMedical,
                        color: bright == Brightness.light
                            ? const Color(0xFFF687D4)
                            : Colors.pink,
                      ),
                    ),
                  ),
                  suffixIcon: textController4.text.isNotEmpty
                      ? InkWell(
                          onTap: () => setState(
                            () => textController4.clear(),
                          ),
                          child: const Icon(
                            Icons.clear,
                            // color: Color(0xFF757575),
                            size: 22,
                          ),
                        )
                      : null,
                ),
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Text(
                'Labels',
                // style: FlutterFlowTheme.bodyText1,
              ),
              TextFormField(
                onChanged: (_) => EasyDebounce.debounce(
                  'textController5',
                  const Duration(milliseconds: 2000),
                  () => setState(() {}),
                ),
                controller: textController5,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Project Label',
                  // labelStyle: FlutterFlowTheme.bodyText1,
                  hintText: 'Type your Project labels here...',
                  // hintStyle: FlutterFlowTheme.bodyText1,
                  // enabledBorder: const UnderlineInputBorder(
                  //   borderSide: BorderSide(
                  //     // color: Color(0x00000000),
                  //     width: 1,
                  //   ),
                  //   borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(4.0),
                  //     topRight: Radius.circular(4.0),
                  //   ),
                  // ),
                  // focusedBorder: const UnderlineInputBorder(
                  //   borderSide: BorderSide(
                  //     // color: Color(0x00000000),
                  //     width: 1,
                  //   ),
                  //   borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(4.0),
                  //     topRight: Radius.circular(4.0),
                  //   ),
                  // ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.laravel,
                      color: bright == Brightness.light
                          ? const Color(0xFFF687D4)
                          : Colors.pink,
                    ),
                  ),
                  suffixIcon: textController5.text.isNotEmpty
                      ? InkWell(
                          onTap: () => setState(
                            () => textController5.clear(),
                          ),
                          child: Icon(
                            Icons.clear,
                            color: bright == Brightness.light
                                ? const Color(0xFFF687D4)
                                : Colors.white,
                            size: 22,
                          ),
                        )
                      : null,
                ),
                // style: FlutterFlowTheme.bodyText1,
              ),
              const Spacer(),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    // print('Button pressed ...');
                  },
                  child: const Text('Create Project'),
                  // options: FFButtonOptions(
                  //   width: double.infinity,
                  //   height: 40,
                  //   // color: FlutterFlowTheme.primaryColor,
                  //   // textStyle: FlutterFlowTheme.subtitle2.override(
                  //   //   fontFamily: 'Poppins',
                  //   //   color: Colors.white,
                  //   // ),
                  //   borderSide: const BorderSide(
                  //     color: Colors.transparent,
                  //     width: 1,
                  //   ),
                  //   borderRadius: 12,
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDateTimePickers() => Column(
        children: [buildFrom(), buildTo()],
      );
  Widget buildFrom() => buildHeader(
        header: 'FROM',
        child: Row(
          children: [
            Expanded(
                // flex: ,
                child: buildDropDownField(
                    text: Utils.toDate(fromDate),
                    onClicked: () => pickFromdateTime(pickDate: true))),
            Expanded(
                child: buildDropDownField(
                    text: Utils.toTime(fromDate),
                    onClicked: () => pickFromdateTime(pickDate: false))),
          ],
        ),
      );
  Widget buildTo() => buildHeader(
        header: 'TO',
        child: Row(
          children: [
            Expanded(
                // flex: 2,
                child: buildDropDownField(
                    text: Utils.toDate(fromDate),
                    onClicked: () => pickTodateTime(pickDate: true))),
            Expanded(
                child: buildDropDownField(
                    text: Utils.toTime(fromDate),
                    onClicked: () => pickTodateTime(pickDate: false))),
          ],
        ),
      );

  Widget buildDropDownField(
          {required String text, required VoidCallback onClicked}) =>
      ListTile(
        title: Text(text),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  buildHeader({required String header, required Row child}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(header), child],
      );

  Future pickFromdateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    if (date == null) return;
    if (date.isAfter(toDate)) {
      toDate = DateTime(
        date.year,
        date.month,
        date.day,
        toDate.hour,
        toDate.minute,
      );
    }
    setState(() => fromDate = date);
  }

  Future pickTodateTime({required bool pickDate}) async {
    final date = await pickDateTime(toDate,
        pickDate: pickDate, firstDate: pickDate ? fromDate : null);
    if (date == null) return;
    // if (date.isAfter(toDate)) {
    //   toDate = DateTime(date.year,date.month,date.day,toDate.hour,toDate.minute,);
    // }
    setState(() => toDate = date);
  }

  Future<DateTime?> pickDateTime(DateTime initialDate,
      {required bool pickDate, DateTime? firstDate}) async {
    if (pickDate) {
      final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate ?? DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (date == null) return null;
      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
          context: context, initialTime: TimeOfDay.fromDateTime(initialDate));
      if (timeOfDay == null) return null;
      final date = DateTime(
        initialDate.year,
        initialDate.month,
        initialDate.day,
      );
      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    }
  }
}
