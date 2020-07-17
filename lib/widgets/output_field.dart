import 'package:flutter/material.dart';

class OutputField extends StatelessWidget {
  String _fieldText;
  OutputField(String val) {
    this._fieldText = val;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(5),
      child: Align(
        alignment: Alignment.centerRight,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            _fieldText,
            style: TextStyle(
              fontSize: 90,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
