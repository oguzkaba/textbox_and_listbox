import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  TextEditingController sortedTFController = TextEditingController();
  TextEditingController sortedTF2Controller = TextEditingController();
  TextEditingController addTFController = TextEditingController();
  TextEditingController colorTFController = TextEditingController();
  List<String> mainList = [];
  List<String> selectList = [];
  Color? bgColor;

  void sortedText() {
    String value = sortedTFController.text;
    if (value.isNotEmpty) {
      value = value.replaceAll(" ", "");
      List<String> stringList = value.split("");
      stringList.sort();
      value = stringList.join();
      sortedTF2Controller.text = value;
      notifyListeners();
    } else {
      sortedTF2Controller.text = "";
      notifyListeners();
    }
  }

  void addList() {
    var value = addTFController.text;
    if (value.isNotEmpty) {
      mainList.add(value);
      notifyListeners();
    }
  }

  void mainMovetoSelectList(int index) {
    selectList.add(mainList[index]);
    mainList.removeAt(index);
    notifyListeners();
  }

  void selectMovetoMainList(int index) {
    mainList.add(selectList[index]);
    selectList.removeAt(index);
    notifyListeners();
  }

  void changeBGColor(String color) {
    switch (color) {
      case "Mavi":
        bgColor = Colors.blue;
        break;
      case "Sarı":
        bgColor = Colors.yellow;
        break;
      case "Kırmızı":
        bgColor = Colors.red;
        break;
      case "Yeşil":
        bgColor = Colors.green;
        break;
      default:
        bgColor = null;
    }
    notifyListeners();
  }
}
