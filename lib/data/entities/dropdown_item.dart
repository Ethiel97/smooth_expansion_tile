import 'package:flutter/cupertino.dart';

class DropdownItem {
  final String name;

  final bool header;
  final IconData iconData;

  DropdownItem({
    required this.name,
    this.header = false,
    required this.iconData,
  });
}
