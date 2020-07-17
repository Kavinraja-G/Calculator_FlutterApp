import 'package:calculator/control/control_operation.dart';
import 'package:calculator/widgets/output_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool operatorStatus = false;
  var toPerform = "";
  var left = "";
  var right = "";
  var _fieldText = "0";
  var operations = ["%", "/", "+", "-", "X"];
  var fieldEffect = ["AC", "+/-"];
  var options = [
    "AC",
    "+/-",
    "%",
    "/",
    "7",
    "8",
    "9",
    "X",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    "00",
    ".",
    "="
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
//NUMBER FIELD
          OutputField(_fieldText),

//GRID LAYOUT WIDGETS
            Container(
                padding: EdgeInsets.all(5),
                color: Colors.black,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  children: List.generate(20, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: FloatingActionButton(
                        onPressed: () {
                          _onPressChange(index);
                        },
                        backgroundColor: (index >= 0 && index <= 2)
                            ? Colors.white38
                            : (index == 3 ||
                                    index == 7 ||
                                    index == 11 ||
                                    index == 15 ||
                                    index == 19)
                                ? Colors.amber[700]
                                : Colors.blueGrey[900],
                        child: Text(
                          options[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    );
                  }),
                )),

//Some Padding at the bottom
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void _onPressChange(int index) {
    print(left + "||" + right);
    String op = options[index];
    Control ctrl = Control(_fieldText, op);
    if (op == "AC") {
      _fieldText = "0";
      operatorStatus = false;
      left = "";
      right = "";
      setState(() {});
    } else if (fieldEffect.contains(op)) {
      _fieldText = ctrl.changeField(_fieldText, op);
      setState(() {});
    } else if (left.isNotEmpty &&
        operations.contains(op) &&
        operatorStatus == false) {
      operatorStatus = true;
      left = _fieldText;
      _fieldText = "0";
      toPerform = op;
      setState(() {});
    } else if (left.isNotEmpty && right.isNotEmpty && operations.contains(op)) {
      _fieldText = ctrl.performOperation(left, right, op);
      left = _fieldText;
      setState(() {});
    } else if (!fieldEffect.contains(op) && operatorStatus == false) {
      if (_fieldText.toString().contains('.') && op == ".") return;
      _fieldText = ctrl.changeField(_fieldText, op);
      left = _fieldText;
      setState(() {});
    } else if (op != "=" && operatorStatus == true) {
      if (_fieldText.toString().contains('.') && op == ".") return;
      _fieldText = ctrl.changeField(_fieldText, op);
      right = _fieldText;
      setState(() {});
    } else if (right.isNotEmpty && (operations.contains(op) || op == "=")) {
      if (op != "=") toPerform = op;
      operatorStatus = false;
      right = _fieldText;
      _fieldText = ctrl.performOperation(left, right, toPerform);
      left = _fieldText;
      right = "";
      toPerform = "";
      setState(() {});
    } else {
      operatorStatus = false;
      left = "";
      right = "";
      setState(() {
        _fieldText = "0";
      });
    }
  }
}
