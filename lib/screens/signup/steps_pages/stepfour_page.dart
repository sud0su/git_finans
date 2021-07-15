import 'package:flutter/material.dart';
import 'package:gin_finans/screens/widgets/dropdown_widget.dart';
import 'package:gin_finans/utils/datetimeformat.dart';

class StepFour extends StatefulWidget {
  const StepFour(TextEditingController date, TextEditingController time,
      GlobalKey<FormState> formKey,
      {Key? key})
      : _date = date,
        _time = time,
        _formKey = formKey,
        super(key: key);
  final GlobalKey<FormState> _formKey;
  final TextEditingController _date;
  final TextEditingController _time;

  @override
  _StepFourState createState() => _StepFourState();
}

class _StepFourState extends State<StepFour> with TickerProviderStateMixin {
  late AnimationController animationController;

  late String _hour, _minute, _time;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        widget._date.text = dateFormatter(selectedDate).toString();
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        widget._time.text = _time;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 150.0, horizontal: 20.0),
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: widget._formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            calendarAnimation(),
            SizedBox(
              height: 30,
            ),
            Text(
              "Schedule Video Call",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Choose the date and time that you prefered, we will send a link via email to make a video call on the scheduled date and time",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: DropDownWidget(
                label: "Date",
                controler: widget._date,
                dataOption: [],
                hintText: "-- Choose Date --",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                _selectTime(context);
              },
              child: DropDownWidget(
                label: "Time",
                controler: widget._time,
                dataOption: [],
                hintText: "-- Choose Time --",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget calendarAnimation() {
    return SizedBox(
      height: 60,
      width: 60,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Container(
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.5),
              shape: CircleBorder(),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0 * animationController.value),
              child: child,
            ),
          );
        },
        child: Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: CircleBorder(),
          ),
          child: IconButton(
            onPressed: () {},
            color: Colors.blue,
            icon: Icon(Icons.calendar_today, size: 24),
          ),
        ),
      ),
    );
  }
}
