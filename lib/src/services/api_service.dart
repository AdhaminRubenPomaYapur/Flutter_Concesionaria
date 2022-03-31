import 'dart:convert';
import 'package:flutter_concesionaria/src/models/cases.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const _request =
      'https://functioninqueueautos.azurewebsites.net/api/Autos/';

  Future<void> requestget() async {
    await http.get(Uri.parse(_request));
    return;
  }

  Future<void> requestgetbyid(String id) async {
    await http.get(Uri.parse('$_request?id=$id'));
    return;
  }

  Future<void> requestpost(Cases cases) async {
    await http.post(
      Uri.parse((_request)),
      body: jsonEncode({
        "id": cases.id,
        "name": cases.name,
        "modelo": cases.modelo,
        "marca": cases.marca,
        "serie": cases.serie,
        "precio": cases.precio,
        "color": cases.color
      }),
    );
    return;
  }

  Future<void> requestUpdate(Cases cases) async {
    await http.put(
      Uri.parse('$_request?id=${cases.id}'),
      body: jsonEncode({
        "id": cases.id,
        "name": cases.name,
        "modelo": cases.modelo,
        "marca": cases.marca,
        "serie": cases.serie,
        "precio": cases.precio,
        "color": cases.color
      }),
    );
    return;
  }

  Future<void> requestDelete(String id) async {
    await http.delete(Uri.parse('$_request?id=$id'));
    return;
  }
}
