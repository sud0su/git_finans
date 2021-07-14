import 'package:flutter/material.dart';
import 'package:gin_finans/screens/widgets/stepper_widget.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final List<String> titles = ["1", "2", "3", "4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StepperWidget(
              curStep: 0,
              titles: titles,
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
              emptyStepper: true,
            ),
            // ElevatedButton(
            //   onPressed: _curStep != titles.length
            //       ? () {
            //           setState(() {
            //             _curStep = _curStep + 1;
            //           });
            //         }
            //       : null,
            // child: Text("Next"),
            // ),
            Text("WelcomeScreen"),
          ],
        ),
      ),
    );
  }
}
