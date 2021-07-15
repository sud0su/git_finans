import 'package:flutter/material.dart';

Future<void> showWidgetFloatingBottomSheet({
  required BuildContext context,
  Widget? child,
  bool isScrollControlled = false,
  double? maxHeight,
  bool isDismissible = false,
  bool enableDrag = true,
}) async {
  showModalBottomSheet(
      isScrollControlled: isScrollControlled,
      context: context,
      backgroundColor: Colors.transparent,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      builder: (context) {
        return Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 0),
              ),
            ],
          ),
          constraints: BoxConstraints(
            minHeight: 100,
            maxHeight: maxHeight == null
                ? MediaQuery.of(context).size.height - 200
                : maxHeight,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  color: Color(0xFFE0E0E0),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    child ?? Container(),
                    SizedBox(height: 20)
                  ],
                ),
              )
            ],
          ),
        );
      });
}
