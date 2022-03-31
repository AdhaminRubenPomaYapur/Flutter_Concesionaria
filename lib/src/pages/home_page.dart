import 'package:flutter/material.dart';
import 'package:flutter_concesionaria/src/providers/menu_providers.dart';

import '../utils/icono_string.util.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Concesionaria'),
        centerTitle: true,
      ),
      body: _lista(),
    );
  }

  _lista() {
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: const [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: _listaItems(snapshot.data, context),
          );
        });
  }

  List<Widget> _listaItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];
    data?.forEach((element) {
      final widgtTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.pushNamed(context, element['ruta']);
        },
      );
      opciones.add(widgtTemp);
      opciones.add(const Divider());
    });
    return opciones;
  }
}
