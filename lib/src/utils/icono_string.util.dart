import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'create': Icons.create,
  'read_more_rounded': Icons.read_more_rounded,
  'system_update_alt': Icons.system_update_alt,
  'delete': Icons.delete
};

Icon getIcon(String nombreIcono) {
  return Icon(
    _icons[nombreIcono],
    color: Colors.blue,
  );
}
