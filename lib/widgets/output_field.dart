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
      padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
      child: Align(
        alignment: Alignment.topRight,
              child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            _fieldText,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 5,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
