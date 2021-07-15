import 'package:flutter/material.dart';
import 'package:gin_finans/utils/validator.dart';

class StepThree extends StatefulWidget {
  const StepThree(GlobalKey<FormState> formKey, {Key? key})
      : _formKey = formKey,
        super(key: key);
  final GlobalKey<FormState> _formKey;

  @override
  _StepThreeState createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  final _validator = Validation();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Three"),
    );
  }
}
