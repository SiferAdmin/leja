import 'package:flutter/material.dart';
import 'package:leja/models/event.dart';
import 'package:leja/services/date/utils.dart';

class EventEditingPage extends StatefulWidget {
  final Event? event;
  const EventEditingPage({
    Key? key,
    this.event,
  }) : super(key: key);

  @override
  _EventEditingPageState createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;
  @override
  void initState() {
    super.initState();
    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 2));
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Event',
          style: TextStyle(fontSize: 24),
        ),
        leading: const CloseButton(),
        actions: buildEditingActions(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              const SizedBox(
                height: 12,
              ),
              buildDateTimePickers(),
            ],
          ),
        ),
      ));
  List<Widget> buildEditingActions() => [
        ElevatedButton.icon(
            onPressed: saveForm,
            style: ElevatedButton.styleFrom(
                primary: Colors.transparent, shadowColor: Colors.transparent),
            icon: const Icon(Icons.done),
            label: const Text('Save'))
      ];

  Widget buildTitle() => TextFormField(
        maxLines: 2,
        autofocus: false,
        key: const ValueKey('itemDesc'),
        // focusNode: _focusEmail,
        validator: (title) =>
            title != null && title.isEmpty ? 'Title cannot be empty' : null,
        // onSaved: (value) {
        //   setState(() {
        //     itemDesc = value!;
        //   });
        // },
        // onChanged: (value) {
        //   itemDesc = value;
        // },
        onFieldSubmitted: (_) => saveForm(),
        controller: titleController,
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'New Event Title',
          labelStyle: const TextStyle(
            fontFamily: 'Lexend Deca',
            // color: Color(0xFF95A1AC),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          hintText: 'Add Title',
          hintStyle: const TextStyle(
            fontFamily: 'Lexend Deca',
            // color: Color(0xFF95A1AC),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              // color: Color(0xFFDBE2E7),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              // color: Color(0xFFDBE2E7),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
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
 
  Widget buildDateTimePickers() => Column(
        children: [buildFrom(), buildTo()],
      );

  Widget buildFrom() => buildHeader(
        header: 'FROM',
        child: Row(
          children: [
            Expanded(
                flex: 2,
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
                flex: 2,
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
