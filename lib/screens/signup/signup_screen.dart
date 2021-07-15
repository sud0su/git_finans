import 'package:flutter/material.dart';
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
  int _curStep = 2;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // firststep
  TextEditingController _fullname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  // secondstep
  TextEditingController _password = TextEditingController();
  // thirdstep
  // finalstep

  final List<String> titles = ["1", "2", "3", "4"];

  List<Widget> _stepsWidet() {
    List<Widget> _registerSteps = [
      StepOne(_fullname, _email, _phonenumber, _formKey),
      StepTwo(_password, _formKey),
      StepThree(_formKey),
      StepFour(_formKey),
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
                "Next",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue.shade300,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (_curStep == _stepsWidet().length) {
                    print("final step.. saving data");
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
}
