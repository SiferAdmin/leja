import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  TextEditingController? textController6;
  TextEditingController? textController7;
  late TextEditingController _controller1;
  late TextEditingController _controller2;
  // ignore: unused_field
  String _valueChanged1 = '';
  String _valueToValidate1 = '';
  // ignore: unused_field
  String _valueSaved1 = '';
  // ignore: unused_field
  String _valueChanged2 = '';
  String _valueToValidate2 = '';
  // ignore: unused_field
  String _valueSaved2 = '';

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  String valueChanged1 = '';
  DateTime now = DateTime.now();
  // ignore: unused_field

  // ignore: unused_field
  final String _valueChanged3 = '';
  // ignore: unused_field
  final String _valueToValidate3 = '';
  // ignore: unused_field
  final String _valueSaved3 = '';
  // ignore: unused_field
  final String _valueChanged4 = '';
  // ignore: unused_field
  final String _valueToValidate4 = '';
  // ignore: unused_field
  final String _valueSaved4 = '';

  String? eventTitle;
  String? eventDesc;
  // ignore: unused_field
  final DateTime _initialValue = DateTime.now();
  late final DateTime newDate;
  late final DateTime toDate;
  bool isChecked = false;

  DateTime selectedDate = DateTime.now();

  DateFormat format = DateFormat("dd.MM.yyyy");

  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'en_US';
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();

    textController4 = TextEditingController(text: '1');
    textController5 = TextEditingController(text: '0');
    textController6 = TextEditingController();
    textController7 = TextEditingController(text: '0');
    _controller1 = TextEditingController(text: DateTime.now().toString());
    _controller2 = TextEditingController(text: DateTime.now().toString());
    //_initialValue = DateTime.now().toString();

    // ignore: unused_local_variable
    String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
    // ignore: unused_local_variable
    String lsMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');
    // _controller4 = TextEditingController(text: '$lsHour:$lsMinute');

    // _getValue();
  }

  // Future<void> _getValue() async {
  //   await Future.delayed(const Duration(seconds: 3), () {
  //     setState(() {
  //       //_initialValue = '2000-10-22 14:30';
  //       _controller1.text = '2000-09-20 14:30';
  //       _controller2.text = '2001-10-21 15:31';
  //       _controller3.text = '2002-11-22';
  //       _controller4.text = '17:01';
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Create Event',
          style: GoogleFonts.getFont('Lexend Deca', fontSize: 24),
        ),
        actions: [
          ElevatedButton.icon(
              onPressed: saveForm,
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, shadowColor: Colors.transparent),
              icon: const Icon(Icons.done),
              label: const Text('Save'))
        ],
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
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildTitle(),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text('FROM'),
                      DateTimePicker(
                        type: DateTimePickerType.dateTime,
                        dateMask: 'd MMMM, yyyy - hh:mm a',
                        controller: _controller1,

                        // initialValue: 'q',
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        //  initialDate: selectedDate,
                        icon: const Icon(Icons.event),
                        dateLabelText: 'Date Time',
                        // timeLabelText: "Hour",
                        use24HourFormat: false,
                        locale: const Locale('en', 'US'),
                        //locale: Locale('pt', 'BR'),
                        // selectableDayPredicate: (date) {
                        //   if (date.weekday == 6 || date.weekday == 7) {
                        //     return false;
                        //   }
                        //   return true;
                        // },
                        onChanged: (val) =>
                            setState(() => _valueChanged1 = val),
                        validator: (val) {
                          setState(() => _valueToValidate1 = val ?? '');
                          // setState(() => newDate = DateTime.parse(val!));
                          return null;
                        },
                        onSaved: (val) =>
                            setState(() => _valueSaved1 = val ?? ''),
                      ),
                      const Text('TO'),
                      DateTimePicker(
                        type: DateTimePickerType.dateTime,
                        dateMask: 'd MMMM, yyyy - hh:mm a',
                        controller: _controller2,
                        // initialValue: 'q',
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                        // initialDate: selectedDate,
                        icon: const Icon(Icons.event),
                        dateLabelText: 'Date Time',
                        // timeLabelText: "Hour",
                        use24HourFormat: false,
                        locale: const Locale('en', 'US'),
                        //locale: Locale('pt', 'BR'),
                        // selectableDayPredicate: (date) {
                        //   if (date.isAfter(selectedDate)||date.isBefore(DateTime(2050))) {
                        //     return false;
                        //   }
                        //   return true;
                        // },

                        onChanged: (val) =>
                            setState(() => _valueChanged2 = val),
                        validator: (val) {
                          setState(() => _valueToValidate2 = val ?? '');
                          return null;
                        },
                        onSaved: (val) =>
                            setState(() => _valueSaved2 = val ?? ''),
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              }),
                          const Text('Is active All Day')
                        ],
                      ),
                      TextFormField(
                        
                        controller: textController3,
                         validator: (desc) =>
            desc != null && desc.isEmpty ? 'Title cannot be empty' : null,
        onSaved: (value) {
          setState(() {
            eventDesc = value!;
          });
        },
        onChanged: (value) {
          eventDesc = value;
        },
        onFieldSubmitted: (_) => saveForm(),
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Event Description',
                          labelStyle: GoogleFonts.getFont(
                            'Lexend Deca',
                          ),
                          hintText: 'Enter Event Description...',
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
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget buildTitle() => TextFormField(
        maxLines: 2,
        autofocus: false,
        key: const ValueKey('eventTitle'),
        // focusNode: _focusEmail,
        validator: (title) =>
            title != null && title.isEmpty ? 'Title cannot be empty' : null,
        onSaved: (value) {
          setState(() {
            eventTitle = value!;
          });
        },
        onChanged: (value) {
          eventTitle = value;
        },
        onFieldSubmitted: (_) => saveForm(),
        controller: titleController,
        obscureText: false,
        decoration: const InputDecoration(
          labelText: 'New Event Title',
          labelStyle: TextStyle(
            fontFamily: 'Lexend Deca',
            // color: Color(0xFF95A1AC),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          hintText: 'Add Title',
          hintStyle: TextStyle(
            fontFamily: 'Lexend Deca',
            // color: Color(0xFF95A1AC),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(
          //     // color: Color(0xFFDBE2E7),
          //     width: 2,
          //   ),
          //   borderRadius: BorderRadius.circular(8),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(
          //     // color: Color(0xFFDBE2E7),
          //     width: 2,
          //   ),
          //   borderRadius: BorderRadius.circular(8),
          // ),
          filled: true,
          // fillColor: Colors.white,
        ),
        style: const TextStyle(
          fontFamily: 'Lexend Deca',
          // color: Color(0xFF2B343A),
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      );

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      // final event = Event(
      //     title: titleController.text,
      //     from: fromDate,
      //     to: toDate,
      //     description: 'Description',
      //     isAllDay: false);
      // final provider=Provider.of<EventProvider>(context,listen: );
      // provider.addEvent(event);
      createEvent();
      Navigator.of(context).pop();
    }
  }

  void createEvent() async {
    CollectionReference ref = FirebaseFirestore.instance
        .collection('UserData')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Events');
    var data = {
      'created': DateTime.now(),
      'title': eventTitle,
      'allDay': isChecked,
      'desc':eventDesc,
      'from': DateTime.parse(_valueToValidate1),
      'to': DateTime.parse(_valueToValidate2),
    };
    ref.add(data);
  }
}
