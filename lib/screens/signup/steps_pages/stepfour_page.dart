import 'package:flutter/material.dart';
import 'package:gin_finans/utils/validator.dart';

class StepFour extends StatefulWidget {
  const StepFour(GlobalKey<FormState> formKey, {Key? key})
      : _formKey = formKey,
        super(key: key);
  final GlobalKey<FormState> _formKey;

  @override
  _StepFourState createState() => _StepFourState();
}

class _StepFourState extends State<StepFour> {
  final _validator = Validation();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Four"),
    );
  }
}
