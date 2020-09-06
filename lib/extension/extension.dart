import 'package:flutter/material.dart';

extension Extension on Widget {
  Widget circleAvatar() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.white,
      shape: StadiumBorder(),
      elevation: 3,
      child: this,
    );
  }
}
