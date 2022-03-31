import 'package:flutter/material.dart';
import 'package:flutter_concesionaria/src/models/cases.dart';
import 'package:flutter_concesionaria/src/services/api_service.dart';
import 'package:http/http.dart' as http;

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final ApiService api = ApiService();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _modeloController = TextEditingController();
  final _marcaController = TextEditingController();
  final _serieController = TextEditingController();
  final _precioController = TextEditingController();
  final _colorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Autos'),
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
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: 'Nombre',
                  hintText: 'Nombre del vehiculo',
                  suffixIcon: const Icon(Icons.car_rental_outlined),
                  icon: const Icon(Icons.car_rental)),
              controller: _nameController,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: 'Modelo',
                  hintText: 'Modelo del vehiculo',
                  suffixIcon: const Icon(Icons.car_rental_outlined),
                  icon: const Icon(Icons.car_rental)),
              controller: _modeloController,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: 'Marca',
                  hintText: 'Marca del vehiculo',
                  suffixIcon: const Icon(Icons.car_rental_outlined),
                  icon: const Icon(Icons.car_rental)),
              controller: _marcaController,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: 'Serie',
                  hintText: 'Serie del vehiculo',
                  suffixIcon: const Icon(Icons.car_rental_outlined),
                  icon: const Icon(Icons.car_rental)),
              controller: _serieController,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: 'Precio',
                  hintText: 'Precio del vehiculo',
                  suffixIcon: const Icon(Icons.car_rental_outlined),
                  icon: const Icon(Icons.car_rental)),
              controller: _precioController,
            ),
          ),
          Container(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: 'Color',
                    hintText: 'Color del vehiculo',
                    suffixIcon: const Icon(Icons.color_lens),
                    icon: const Icon(Icons.color_lens_sharp)),
                controller: _colorController,
              )),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 20.0, right: 20.0),
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 90,
                ),
                ElevatedButton(
                  onPressed: (() => _enviarDatos(
                      _idController.text,
                      _nameController.text,
                      _modeloController.text,
                      _marcaController.text,
                      _serieController.text,
                      double.parse(_precioController.text),
                      _colorController.text)),
                  child: const Text('Enviar datos'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue, onPrimary: Colors.white),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: (() => Navigator.pop(context)),
                  child: const Text('Volver'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue, onPrimary: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Para el post
  void _enviarDatos(String id, String name, String modelo, String marca,
      String serie, double precio, String color) async {
    api.requestpost(Cases(
        id: id,
        name: name,
        modelo: modelo,
        marca: marca,
        serie: serie,
        precio: precio,
        color: color));
    final response = await http
        .get(Uri.parse('https://webapisalida.azurewebsites.net/post'));

    Future.delayed(const Duration(seconds: 5));
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              title: const Text('POST'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Text('Enviado Correctamente'),
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
