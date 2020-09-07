import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

extension Extension on Widget {
  Widget bandagevalue() {
    return Badge(
      showBadge: true,
      child: this,
    );
  }
}
