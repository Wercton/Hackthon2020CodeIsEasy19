import 'package:flutter/material.dart';

class AppRoot extends InheritedWidget {
  AppRoot({Widget child, Key key}) : super(key: key, child: child);

  final constants = Constants();

  static AppRoot of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  // Return Static color from the contexts constants
  static Color getColor(BuildContext context, String colorCode) =>
      AppRoot.of(context).constants.getColor(colorCode);

  @override
  bool updateShouldNotify(AppRoot oldWidget) => oldWidget != this;
}

class Constants {
  Map colors = {
    "production": {
      "first": Color.fromARGB(255, 247, 178, 103),
      "second": Color.fromARGB(255, 247, 157, 101),
      "third": Color.fromARGB(255, 244, 132, 95),
      "fourth": Color.fromARGB(255, 242, 112, 89),
      "fifth": Color.fromARGB(255, 242, 92, 84),
      "iconColor": Color.fromARGB(255, 255, 255, 255)
    }
  };

  // Return Color of the code received
  Color getColor(String colorCode) {
    assert(colors['production'].containsKey(colorCode),
        'colorCode must exist on colors[' + 'production' + '] Map');
    return colors['production'][colorCode];
  }
}
