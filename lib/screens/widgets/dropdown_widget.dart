import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget(
      {Key? key,
      required String label,
      required String hintText,
      required List<Map<String, String>> dataOption,
      required TextEditingController controler})
      : _labelText = label,
        _hintText = hintText,
        _dataOption = dataOption,
        _controler = controler,
        super(key: key);

  final String _labelText;
  final String _hintText;
  final TextEditingController _controler;
  final List<Map<String, String>> _dataOption;

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
      decoration: InputDecoration(
        labelText: widget._labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.fromLTRB(12, 15, 12, 15),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        // errorStyle: ,
        labelStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      validator: (value) => value == null ? 'Please select one option' : null,
      hint: Text(
        widget._controler.text == ''
            ? widget._hintText
            : widget._controler.text,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
      value: widget._controler.text == '' ? null : widget._controler.text,
      onChanged: (dynamic value) {
        setState(() {
          widget._controler.text = value;
        });
      },
      items: widget._dataOption.map(
        (item) {
          return DropdownMenuItem<dynamic>(
            value: item['value'],
            child: Text(
              item['display'] ?? '',
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ).toList(),
    );
  }
}
