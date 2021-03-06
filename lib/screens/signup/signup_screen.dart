import 'package:flutter/material.dart';
import 'package:gin_finans/screens/widgets/bottomsheet_widget.dart';
import 'package:gin_finans/screens/widgets/divider_widget.dart';
import 'package:gin_finans/screens/widgets/stepper_widget.dart';

import 'steps_pages/stepfour_page.dart';
import 'steps_pages/stepone_page.dart';
import 'steps_pages/stepthree_page.dart';
import 'steps_pages/steptwo_page.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int _curStep = 1;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // firststep
  TextEditingController _fullname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  // secondstep
  TextEditingController _password = TextEditingController();
  // thirdstep
  TextEditingController _goalforactivation = TextEditingController();
  TextEditingController _monthlyincome = TextEditingController();
  TextEditingController _monthlyexpense = TextEditingController();
  // finalstep
  TextEditingController _date = TextEditingController();
  TextEditingController _time = TextEditingController();

  final List<String> titles = ["1", "2", "3", "4"];

  List<Widget> _stepsWidet() {
    List<Widget> _registerSteps = [
      StepOne(_fullname, _email, _phonenumber, _formKey),
      StepTwo(_password, _formKey),
      StepThree(_goalforactivation, _monthlyincome, _monthlyexpense, _formKey),
      StepFour(_date, _time, _formKey),
    ];
    return _registerSteps;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        color: Colors.blue,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: _stepsWidet()[_curStep - 1],
            ),
            Positioned(
              child: Container(
                height: MediaQuery.of(context).size.height * .1,
                color: Colors.blue,
                child: StepperWidget(
                  curStep: _curStep,
                  titles: titles,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green.shade600,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: floatingRegisterButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Padding floatingRegisterButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _curStep == 1
              ? SizedBox()
              : SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 45,
                  child: TextButton(
                    child: Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 1, color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() => _curStep = _curStep - 1);
                    },
                  ),
                ),
          SizedBox(
            width: 10.0,
          ),
          SizedBox(
            width: _curStep == 1
                ? MediaQuery.of(context).size.width * 0.9
                : MediaQuery.of(context).size.width * 0.7,
            height: 45,
            child: ElevatedButton(
              child: Text(
                _curStep == 4 ? "Register" : "Next",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: _curStep == 4
                    ? Colors.green.shade400
                    : Colors.blue.shade300,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (_curStep == 4) {
                    print(_fullname.text);
                    print(_email.text);
                    print(_phonenumber.text);
                    print(_password.text);
                    print(_goalforactivation.text);
                    print(_monthlyincome.text);
                    print(_monthlyexpense.text);
                    print(_date.text);
                    print(_time.text);
                    showWidgetFloatingBottomSheet(
                      context: context,
                      isDismissible: true,
                      child: _informationPreviewData(),
                    );
                  } else {
                    setState(() => _curStep = _curStep + 1);
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _informationPreviewData() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          Text(
            "Registration is complete",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          HorizontalDivider(
            text: "Saved data",
            icon: Icons.verified,
            textColor: Colors.green,
            iconColor: Colors.green,
          ),
          SizedBox(
            height: 10.0,
          ),
          _previewData(_fullname.text, Icons.person),
          SizedBox(height: 10.0),
          _previewData(_email.text, Icons.email),
          SizedBox(height: 10.0),
          _previewData(_phonenumber.text, Icons.phone),
          SizedBox(height: 10.0),
          _previewData(_password.text, Icons.security),
          SizedBox(height: 10.0),
          _previewData(_goalforactivation.text, Icons.star_border),
          SizedBox(height: 10.0),
          _previewData(_monthlyexpense.text, Icons.money),
          SizedBox(height: 10.0),
          _previewData(_monthlyincome.text, Icons.money),
          SizedBox(height: 10.0),
          _previewData(_date.text, Icons.calendar_today),
          SizedBox(height: 10.0),
          _previewData(_time.text, Icons.calendar_view_day),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget _previewData(String text, IconData icon) => Row(
        children: [
          Icon(
            icon,
            size: 15,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
        ],
      );
}
