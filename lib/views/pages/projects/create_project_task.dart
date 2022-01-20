import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leja/main.dart';
import 'package:leja/services/date/utils.dart';
import 'package:leja/utils/validator/validator.dart';

class CreateProjectTask extends StatefulWidget {
  const CreateProjectTask({Key? key}) : super(key: key);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<CreateProjectTask> {
  String dropDownValue = 'Select Status';
  late TextEditingController textController1;
  late TextEditingController textController2;
  late TextEditingController textController3;
  late TextEditingController textController4;
  late DateTime fromDate;
  late DateTime toDate;
  late final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    fromDate = DateTime.now();
    toDate = DateTime.now().add(const Duration(hours: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        // backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: const Text(
          'Create Task',
          // style: FlutterFlowTheme.bodyText1,
        ),
        actions: const [],
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
              const Text(
                'Task Title',
                // style: FlutterFlowTheme.bodyText1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  enableSuggestions: true,
                  key: const ValueKey('title'),
                  textCapitalization: TextCapitalization.words,
                  validator: (value) => Validator.validateTitle(
                    title: value,
                  ),
                  onChanged: (_) => EasyDebounce.debounce(
                    'textController1',
                    const Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  controller: textController1,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: const TextStyle(
                      fontFamily: 'Lexend Deca',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    hintText: 'Enter Task title...',
                    hintStyle: const TextStyle(
                      fontFamily: 'Lexend Deca',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FaIcon(
                        FontAwesomeIcons.tags,
                        color: bright == Brightness.light
                            ? const Color(0xFFF687D4)
                            : Colors.pink,
                      ),
                    ),
                    suffixIcon: textController1.text.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () => setState(
                                () => textController1.clear(),
                              ),
                              child: Icon(
                                Icons.clear,
                                color: bright == Brightness.light
                                    ? const Color(0xFFF687D4)
                                    : Colors.pink,
                                size: 22,
                              ),
                            ),
                          )
                        : null,
                  ),
                  style: const TextStyle(
                    fontFamily: 'Lexend Deca',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              const Text(
                'Task Description',
              ),
              // TextFormField(
              //   onChanged: (_) => EasyDebounce.debounce(
              //     'textController2',
              //     const Duration(milliseconds: 2000),
              //     () => setState(() {}),
              //   ),
              //   controller: textController2,
              //   obscureText: false,
              //   decoration: InputDecoration(
              //     hintText: 'Enter Task description...',
              //     // hintStyle: FlutterFlowTheme.bodyText1,
              //     enabledBorder: const UnderlineInputBorder(
              //       borderSide: BorderSide(
              //         // color: Color(0x00000000),
              //         width: 1,
              //       ),
              //       borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(4.0),
              //         topRight: Radius.circular(4.0),
              //       ),
              //     ),
              //     focusedBorder: const UnderlineInputBorder(
              //       borderSide: BorderSide(
              //         // color: Color(0x00000000),
              //         width: 1,
              //       ),
              //       borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(4.0),
              //         topRight: Radius.circular(4.0),
              //       ),
              //     ),
              //     prefixIcon: FaIcon(
              //       FontAwesomeIcons.marker,
              //       color: bright == Brightness.light
              //           ? const Color(0xFFF687D4)
              //           : Colors.pink,
              //     ),
              //     suffixIcon: textController2.text.isNotEmpty
              //         ? InkWell(
              //             onTap: () => setState(
              //               () => textController2.clear(),
              //             ),
              //             child: Icon(
              //               Icons.clear,
              //               color: bright == Brightness.light
              //                   ? const Color(0xFFF687D4)
              //                   : Colors.pink,
              //               size: 22,
              //             ),
              //           )
              //         : null,
              //   ),
              //   // style: FlutterFlowTheme.bodyText1,
              //   maxLines: 5,
              //   keyboardType: TextInputType.multiline,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  enableSuggestions: true,
                  key: const ValueKey('title'),
                  textCapitalization: TextCapitalization.words,
                  validator: (value) => Validator.validateTitle(
                    title: value,
                  ),
                  onChanged: (_) => EasyDebounce.debounce(
                    'textController2',
                    const Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  controller: textController2,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Task Description',
                    labelStyle: const TextStyle(
                      fontFamily: 'Lexend Deca',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    hintText: 'Enter Task description...',
                    hintStyle: const TextStyle(
                      fontFamily: 'Lexend Deca',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FaIcon(
                        FontAwesomeIcons.marker,
                        color: bright == Brightness.light
                            ? const Color(0xFFF687D4)
                            : Colors.pink,
                      ),
                    ),
                    suffixIcon: textController1.text.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () => setState(
                                () => textController1.clear(),
                              ),
                              child: Icon(
                                Icons.clear,
                                color: bright == Brightness.light
                                    ? const Color(0xFFF687D4)
                                    : Colors.pink,
                                size: 22,
                              ),
                            ),
                          )
                        : null,
                  ),
                  style: const TextStyle(
                    fontFamily: 'Lexend Deca',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                ),
              ),

              const Text(
                'Due Date',
                // style: FlutterFlowTheme.bodyText1,
              ),
              buildTo(),
              const Text(
                'Task Status',
                // style: FlutterFlowTheme.bodyText1,
              ),
              DropdownButton(
                items: <String>[
                  'Open',
                  'Pending',
                  'Closed',
                  'Scheduled',
                  'Deffered '
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: Text(dropDownValue),
                onChanged: (val) =>
                    setState(() => dropDownValue = val.toString()),
                elevation: 2,
                //  icon: const FaIcon(
                //   FontAwesomeIcons.boxOpen,
                // ),
                // value: dropDownValue1,
              ),
              // FlutterFlowDropDown(
              //   options: [
              //     'Open',
              //     'Pending',
              //     'Closed',
              //     'Scheduled',
              //     'DefferedDeferred '
              //   ].toList(),
              //   onChanged: (val) => setState(() => dropDownValue = val),
              //   width: 180,
              //   height: 50,
              //   textStyle: FlutterFlowTheme.bodyText1.override(
              //     fontFamily: 'Poppins',
              //     color: Colors.black,
              //   ),
              //   icon: const FaIcon(
              //     FontAwesomeIcons.boxOpen,
              //   ),
              //   fillColor: Colors.white,
              //   elevation: 2,
              //   borderColor: Colors.transparent,
              //   borderWidth: 0,
              //   borderRadius: 0,
              //   margin: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              //   hidesUnderline: true,
              // ),

              const Text(
                'Cost',
                // style: FlutterFlowTheme.bodyText1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'textController3',
                    const Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  controller: textController3,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Etimated task Cost',
                    // labelStyle: FlutterFlowTheme.bodyText1,
                    hintText: 'Enter the Estimated Task Cost',
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
                        FontAwesomeIcons.moneyBillWave,
                        color: bright == Brightness.light
                            ? const Color(0xFFF687D4)
                            : Colors.pink,
                      ),
                    ),
                    suffixIcon: textController3.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => textController3.clear(),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: bright == Brightness.light
                                  ? const Color(0xFFF687D4)
                                  : Colors.pink,
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  // style: FlutterFlowTheme.bodyText1,
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(
                'Notes',
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
                  hintText: 'Enter Task notes...',
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
                      FontAwesomeIcons.solidStickyNote,
                      color: bright == Brightness.light
                          ? const Color(0xFFF687D4)
                          : Colors.pink,
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
                maxLines: 5,
                keyboardType: TextInputType.multiline,
              ),
              ElevatedButton(
                onPressed: () {
                  // print('Button pressed ...');
                },
                child: const Text('Create Task'),
                // options: FFButtonOptions(
                //   width: 130,
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
            ],
          ),
        ),
      ),
    );
  }

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
