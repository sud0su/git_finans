import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final IconData? icon;
  final Color? iconColor;

  const HorizontalDivider(
      {Key? key, this.text, this.icon, this.textColor, this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            endIndent: 5,
          ),
        ),
        icon != null
            ? Icon(
                icon,
                color: iconColor ?? Colors.black45.withOpacity(0.5),
                size: 17,
              )
            : SizedBox(),
        text != null
            ? SizedBox(
                width: 3.0,
              )
            : SizedBox(),
        Text(
          (text != null ? text : '')!,
          style: TextStyle(
            color: textColor ?? Colors.black45.withOpacity(0.5),
            fontSize: 13.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            indent: text != null ? 5 : 3,
          ),
        ),
      ],
    );
  }
}
