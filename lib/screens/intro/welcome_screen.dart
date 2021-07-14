import 'package:flutter/material.dart';
import 'package:gin_finans/screens/widgets/stepper_widget.dart';

import 'components/custom_pointer.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Stack(
        children: [
          CustomPaint(
            painter: ShapePainter(),
            child: Container(
              height: 180,
            ),
          ),
          Positioned(
            bottom: 120,
            child: StepperWidget(
              curStep: 0,
              titles: titles,
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
              emptyStepper: true,
            ),
          ),
        ],
      ),
    );
  }
}
