import 'package:date_time_picker/date_time_picker.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
  late TextEditingController _controller3;
  late TextEditingController _controller4;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();

  String _valueChanged1 = '';
  String _valueToValidate1 = '';
  String _valueSaved1 = '';
  String _valueChanged2 = '';
  String _valueToValidate2 = '';
  String _valueSaved2 = '';
  String _valueChanged3 = '';
  String _valueToValidate3 = '';
  String _valueSaved3 = '';
  String _valueChanged4 = '';
  String _valueToValidate4 = '';
  String _valueSaved4 = '';

  String? eventTitle;

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
    Intl.defaultLocale = 'pt_BR';
    //_initialValue = DateTime.now().toString();
    _controller1 = TextEditingController(text: DateTime.now().toString());
    _controller2 = TextEditingController(text: DateTime.now().toString());
    _controller3 = TextEditingController(text: DateTime.now().toString());

    String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
    String lsMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');
    _controller4 = TextEditingController(text: '$lsHour:$lsMinute');

    _getValue();
  }

  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        //_initialValue = '2000-10-22 14:30';
        _controller1.text = '2000-09-20 14:30';
        _controller2.text = '2001-10-21 15:31';
        _controller3.text = '2002-11-22';
        _controller4.text = '17:01';
      });
    });
  }

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
                        type: DateTimePickerType.dateTimeSeparate,
                        dateMask: 'd MMM, yyyy',
                        controller: _controller1,
                        //initialValue: _initialValue,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: const Icon(Icons.event),
                        dateLabelText: 'Date',
                        timeLabelText: "Hour",
                        //use24HourFormat: false,
                        //locale: Locale('pt', 'BR'),
                        selectableDayPredicate: (date) {
                          if (date.weekday == 6 || date.weekday == 7) {
                            return false;
                          }
                          return true;
                        },
                        onChanged: (val) =>
                            setState(() => _valueChanged1 = val),
                        validator: (val) {
                          setState(() => _valueToValidate1 = val ?? '');
                          return null;
                        },
                        onSaved: (val) =>
                            setState(() => _valueSaved1 = val ?? ''),
                      ),
                      const Text('TO'),
                      DateTimePicker(
                        type: DateTimePickerType.dateTimeSeparate,
                        dateMask: 'd MMM, yyyy',
                        controller: _controller1,
                        //initialValue: _initialValue,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: const Icon(Icons.event),
                        dateLabelText: 'Date',
                        timeLabelText: "Hour",
                        //use24HourFormat: false,
                        //locale: Locale('pt', 'BR'),
                        selectableDayPredicate: (date) {
                          if (date.weekday == 6 || date.weekday == 7) {
                            return false;
                          }
                          return true;
                        },
                        onChanged: (val) =>
                            setState(() => _valueChanged1 = val),
                        validator: (val) {
                          setState(() => _valueToValidate1 = val ?? '');
                          return null;
                        },
                        onSaved: (val) =>
                            setState(() => _valueSaved1 = val ?? ''),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          const Text('Is active All Day')
                        ],
                      ),
                      TextFormField(
                        onChanged: (_) => EasyDebounce.debounce(
                          'textController3',
                          const Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        controller: textController3,
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
        decoration:const InputDecoration(
          labelText: 'New Event Title',
          labelStyle:  TextStyle(
            fontFamily: 'Lexend Deca',
            // color: Color(0xFF95A1AC),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          hintText: 'Add Title',
          hintStyle:  TextStyle(
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
      Navigator.of(context).pop();
    }
  }
}
