import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_concesionaria/src/models/cases.dart';
import 'package:flutter_concesionaria/src/services/api_service.dart';
import 'package:http/http.dart' as http;

class ReadPage extends StatefulWidget {
  const ReadPage({Key? key}) : super(key: key);
  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ver Autos'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Cases>>(
        future: getCases(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Cases>? data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 50,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('id: ' + data[index].id),
                        const SizedBox(
                          width: 2,
                        ),
                        Text('marca: ' + data[index].marca),
                        const SizedBox(
                          width: 2,
                        ),
                        Text('color: ' + data[index].color),
                        const SizedBox(
                          width: 2,
                        ),
                        const Icon(Icons.car_rental_sharp),
                        const SizedBox(
                          width: 2,
                        ),
                        Text('precio: ' + data[index].precio.toString())
                      ],
                    ));
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

//Future<List<dynamic>>>
Future<List<Cases>> getCases() async {
  final api = ApiService();
  api.requestget();
  Future.delayed(const Duration(seconds: 5));
  final response =
      await http.get(Uri.parse('https://webapisalida.azurewebsites.net/get'));
  Future.delayed(const Duration(seconds: 5));
  if (response.statusCode == 200) {
    ResponseGet newResponse = ResponseGet.fromJson(json.decode(response.body));
    List<Cases> autos = [];
    for (int i = 0; i < newResponse.autos!.length; i++) {
      autos.add(Cases.fromJson(newResponse.autos![i]));
    }
    return autos;
  } else {
    throw Exception('Failed to create album.');
  }
}
