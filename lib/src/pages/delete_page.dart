import 'package:flutter/material.dart';
import 'package:flutter_concesionaria/src/services/api_service.dart';
import 'package:http/http.dart' as http;

class DeletePage extends StatefulWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  final api = ApiService();
  final _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eliminar Auto'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: 'ID',
                  hintText: 'Id del Vehiculo',
                  suffixIcon: const Icon(Icons.insert_drive_file),
                  icon: const Icon(Icons.car_rental_sharp)),
              controller: _idController,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10.0, right: 30.0, left: 30.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 60, right: 10.0),
                  child: ElevatedButton(
                      onPressed: () => _eliminarDatos(_idController),
                      child: const Text("Eliminar Vehiculo"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue, onPrimary: Colors.white)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 30.0),
                  child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Volver"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue, onPrimary: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _eliminarDatos(TextEditingController id) async {
    api.requestDelete(id.text);
    final response = await http
        .get(Uri.parse('https://webapisalida.azurewebsites.net/delete'));
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              title: const Text('DELETE'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Text('Eliminado Correctamente'),
                  Icon(Icons.car_rental_sharp)
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          });
    }
  }
}
