import 'package:flutter/material.dart';

final _iconsMap = <String, IconData> {
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
};

Icon getIcon (String iconName) {
  return Icon(_iconsMap[iconName]);
}