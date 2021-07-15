import 'package:flutter/material.dart';
import 'package:gin_finans/data/model/dropdown_exampledata.dart';
import 'package:gin_finans/screens/widgets/dropdown_widget.dart';

class StepThree extends StatefulWidget {
  const StepThree(
      TextEditingController goalforactivation,
      TextEditingController monthlyincome,
      TextEditingController monthlyexpense,
      GlobalKey<FormState> formKey,
      {Key? key})
      : _formKey = formKey,
        _goalforactivation = goalforactivation,
        _monthlyincome = monthlyincome,
        _monthlyexpense = monthlyexpense,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _goalforactivation;
  final TextEditingController _monthlyincome;
  final TextEditingController _monthlyexpense;

  @override
  _StepThreeState createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
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
            Text(
              "Personal Information",
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
              "Please fill in the information below and your goal for digital saving.",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DropDownWidget(
              label: "Goal for activation",
              controler: widget._goalforactivation,
              dataOption: dataOption,
              hintText: "-- Choose Option --",
            ),
            SizedBox(
              height: 20,
            ),
            DropDownWidget(
              label: "Monthly income",
              controler: widget._monthlyincome,
              dataOption: dataOption,
              hintText: "-- Choose Option --",
            ),
            SizedBox(
              height: 20,
            ),
            DropDownWidget(
              label: "Monthly expense",
              controler: widget._monthlyexpense,
              dataOption: dataOption,
              hintText: "-- Choose Option --",
            )
          ],
        ),
      ),
    );
  }
}
