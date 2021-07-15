import 'package:flutter/material.dart';

class StepperWidget extends StatelessWidget {
  StepperWidget({
    Key? key,
    required int curStep,
    required List<String> titles,
    required double width,
    required Color color,
    bool? emptyStepper,
  })  : _titles = titles,
        _curStep = curStep,
        _width = width,
        _emptyStepper = emptyStepper ?? false,
        _activeColor = color,
        assert(emptyStepper ?? curStep > 0 == true && curStep <= titles.length),
        assert(width > 0),
        super(key: key);

  final double _width;
  final List<String> _titles;
  final bool _emptyStepper;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor = Colors.grey.shade200;
  final double lineWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          left: 24.0,
          right: 24.0,
        ),
        width: this._width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _titleViews(),
        ));
  }

  List<Widget> _titleViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, text) {
      Color circleColor = _inactiveColor;
      Color lineColor = _inactiveColor;
      Color textColor = _activeColor;
      if (_emptyStepper != true) {
        circleColor =
            (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;
        lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;
        textColor =
            (i == 0 || _curStep > i + 1) ? _inactiveColor : _activeColor;
      }

      list.add(
        Container(
          width: 60.0,
          height: 60.0,
          padding: EdgeInsets.all(0),
          decoration: new BoxDecoration(
            color: circleColor,
            borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
            border: new Border.all(
              color: Colors.green.shade800,
              width: 2.0,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

      if (i != _titles.length - 1) {
        list.add(
          Expanded(
            child: Container(
              height: lineWidth,
              color: _emptyStepper ? _activeColor : lineColor,
            ),
          ),
        );
      }
    });
    return list;
  }
}
