import 'package:flutter/material.dart';
import 'package:gin_finans/screens/components/custom_pointer.dart';
import 'package:gin_finans/utils/validator.dart';

class StepOne extends StatefulWidget {
  StepOne(TextEditingController fullname, TextEditingController email,
      TextEditingController phonenumber, GlobalKey<FormState> formKey,
      {Key? key})
      : _fullname = fullname,
        _email = email,
        _phonenumber = phonenumber,
        _formKey = formKey,
        super(key: key);

  final TextEditingController _fullname;
  final TextEditingController _email;
  final TextEditingController _phonenumber;
  final GlobalKey<FormState> _formKey;

  @override
  _StepOneState createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  final _validator = Validation();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPaint(
            painter: ShapePainter(),
            child: Container(
              height: 200,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0, -30.0, 0.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: RichText(
                    text: TextSpan(
                      text: 'Welcome to ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 45.0,
                        letterSpacing: -2,
                      ),
                      children: [
                        TextSpan(text: 'GIN'),
                        TextSpan(
                          text: ' Finans',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: RichText(
                    text: TextSpan(
                      text: 'Welcome to The Bank of The Future. ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                      children: [
                        TextSpan(
                            text: 'Manage and track your accounts on the go.'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Form(
                    key: widget._formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: widget._fullname,
                          validator: _validator.required,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            fillColor: Colors.grey.shade200,
                            hintText: "Fullname",
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: widget._email,
                          validator: _validator.email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            fillColor: Colors.grey.shade200,
                            hintText: "Email",
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          maxLength: 12,
                          controller: widget._phonenumber,
                          validator: _validator.phoneNumber,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            fillColor: Colors.grey.shade200,
                            hintText: "Phone Number",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          RotatedBox(
            quarterTurns: 2,
            child: CustomPaint(
              painter: ShapePainter(),
              child: Container(
                height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
