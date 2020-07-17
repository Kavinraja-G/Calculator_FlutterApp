class Control {
  String inputField;
  String operation;

  //Constructor
  Control(String inputfield, String operation) {
    inputfield = inputField;
    operation = operation;
  }
  String performOperation(String left, String right, String perform) {
    switch (perform) {
      case "+":
        return (double.parse(left) + double.parse(right)).toString();
        break;
      case "-":
        return (double.parse(left) - double.parse(right)).toString();
        break;
      case "/":
        return (double.parse(left) / double.parse(right)).toString();
        break;
      case "X":
        return (double.parse(left) * double.parse(right)).toString();
        break;
      case "%":
        return (double.parse(left) % double.parse(right)).toString();
        break;
      default:
        return "0";
        break;
    }
  }

  String changeField(String left, String operation) {
    String result;
    switch (operation) {
      case "AC":
        result = "0";
        break;
      case "+/-":
        var num = double.parse(left);
        num = num * -1;
        result = num.toString();
        break;
      case ".":
        result = left + ".";
        break;
      case "00":
        result = left + "00";
        break;
      case "0":
      case "1":
      case "2":
      case "3":
      case "4":
      case "5":
      case "6":
      case "7":
      case "8":
      case "9":
        result = (left == "0") ? operation : left + operation;
        break;
      default:
        result = "0";
        break;
    }
    return result;
  }
}
