import 'dart:convert';
import 'package:flutter/services.dart';

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider();

  Future<List<dynamic>> cargarData() async {
    final respons = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(respons);
    opciones = dataMap['rutas'];
    return opciones;
  }
}

final menuProvider = _MenuProvider();
