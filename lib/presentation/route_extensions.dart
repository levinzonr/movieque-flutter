import 'package:flutter/material.dart';

extension RouteExtensions on BuildContext {
  push(Widget widget, {bool isFoolScreenDialog=false}) {
    Navigator.push(this, MaterialPageRoute(builder: (c) => widget, fullscreenDialog: isFoolScreenDialog));
  }
}