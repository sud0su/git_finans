import 'package:flutter/material.dart';
import 'package:gin_finans/utils/passwordchecker.dart';
import 'package:gin_finans/utils/validator.dart';

class StepTwo extends StatefulWidget {
  StepTwo(TextEditingController password, GlobalKey<FormState> formKey,
      {Key? key})
      : _password = password,
        _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _password;

  @override
  _StepTwoState createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  final _validator = Validation();
  bool _showPass = false;

  bool _hasLowercase = false;
  bool _hasUppercase = false;
  bool _hasDigits = false;
  bool _hasLenght = false;
  double _passwordStrength = 0;
  String _passwordMeter = '-';
  Color _passwordMeterColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    widget._password.addListener(() {
      _passwordStrength =
          estimateBruteforceStrength(widget._password.text) * 100;
      if (_passwordStrength >= 1.0 && _passwordStrength < 10.0) {
        setStateIfMounted(() {
          _passwordMeter = "Too short";
          _passwordMeterColor = Colors.red;
        });
      } else if (_passwordStrength >= 10.0 && _passwordStrength < 20.0) {
        setStateIfMounted(() {
          _passwordMeter = "Very Weak";
          _passwordMeterColor = Colors.red.shade400;
        });
      } else if (_passwordStrength >= 20.0 && _passwordStrength < 40.0) {
        setStateIfMounted(() {
          _passwordMeter = "Weak";
          _passwordMeterColor = Colors.yellow.shade700;
        });
      } else if (_passwordStrength >= 40.0 && _passwordStrength < 70) {
        setStateIfMounted(() {
          _passwordMeter = "Medium";
          _passwordMeterColor = Colors.green.shade400;
        });
      } else if (_passwordStrength >= 70.0) {
        setStateIfMounted(() {
          _passwordMeter = "Strong";
          _passwordMeterColor = Colors.lightGreenAccent;
        });
      } else {
        setStateIfMounted(() => _passwordMeter = "-");
      }

      setStateIfMounted(() {
        if (_hasLowercase = widget._password.text.contains(RegExp(r'[a-z]'))) {
          _hasLowercase = true;
        }
        if (_hasUppercase = widget._password.text.contains(RegExp(r'[A-Z]'))) {
          _hasUppercase = true;
        }
        if (_hasDigits = widget._password.text.contains(RegExp(r'[0-9]'))) {
          _hasDigits = true;
        }
        if (widget._password.text.length >= 9) {
          _hasLenght = true;
        } else {
          _hasLenght = false;
        }
      });
    });
  }

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 150.0, horizontal: 20.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Create Password",
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
            "Password will be used to login to account",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Form(
            key: widget._formKey,
            child: TextFormField(
              controller: widget._password,
              validator: _validator.validatePassword,
              obscureText: !_showPass,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() => _showPass = !_showPass);
                  },
                  icon: _showPass
                      ? Icon(
                          Icons.visibility,
                          color: Theme.of(context).primaryColor,
                        )
                      : Icon(Icons.visibility_off, color: Colors.grey),
                ),
                hintText: "Create Password",
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          RichText(
            text: TextSpan(
              text: 'Complexity : ',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: _passwordMeter,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _passwordMeterColor,
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                        color: Colors.black26,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          SizedBox(
            height: 50.0,
          ),
          _passwordIndicatior(),
        ],
      ),
    );
  }

  Row _passwordIndicatior() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _hasLowercase
                ? Icon(
                    Icons.check_circle,
                    size: 40.0,
                    color: Colors.greenAccent,
                  )
                : Text(
                    "a",
                    style: TextStyle(
                      fontSize: 35.0,
                    ),
                  ),
            SizedBox(height: 2.0),
            Text("Lowercase"),
          ],
        ),
        Column(
          children: [
            _hasUppercase
                ? Icon(
                    Icons.check_circle,
                    size: 40.0,
                    color: Colors.greenAccent,
                  )
                : Text(
                    "A",
                    style: TextStyle(
                      fontSize: 35.0,
                    ),
                  ),
            SizedBox(height: 2.0),
            Text("Uppercase"),
          ],
        ),
        Column(
          children: [
            _hasDigits
                ? Icon(
                    Icons.check_circle,
                    size: 40.0,
                    color: Colors.greenAccent,
                  )
                : Text(
                    "123",
                    style: TextStyle(
                      fontSize: 35.0,
                    ),
                  ),
            SizedBox(height: 2.0),
            Text("Number"),
          ],
        ),
        Column(
          children: [
            _hasLenght
                ? Icon(
                    Icons.check_circle,
                    size: 40.0,
                    color: Colors.greenAccent,
                  )
                : Text(
                    "9+",
                    style: TextStyle(
                      fontSize: 35.0,
                    ),
                  ),
            SizedBox(height: 2.0),
            Text("Characters"),
          ],
        )
      ],
    );
  }
}
