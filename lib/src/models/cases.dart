class Cases {
  final String id;
  final String name;
  final String modelo;
  final String marca;
  final String serie;
  final double precio;
  final String color;

  const Cases(
      {required this.id,
      required this.name,
      required this.modelo,
      required this.marca,
      required this.serie,
      required this.precio,
      required this.color});

  factory Cases.fromJson(Map<dynamic, dynamic> json) {
    return Cases(
        id: json['id'] as String,
        name: json['name'] as String,
        modelo: json['modelo'] as String,
        marca: json['marca'] as String,
        serie: json['serie'] as String,
        precio: json['precio'] as double,
        color: json['color'] as String);
  }

  @override
  String toString() {
    return 'Trans{id: $id, name: $modelo, color: $color}';
  }
}

class ResponseGet {
  final String method;
  final bool success;
  final List<dynamic>? autos;
  final String? id;

  ResponseGet(this.success, this.method, {this.autos, this.id});

  factory ResponseGet.fromJson(Map<String, dynamic> json) {
    return ResponseGet(
      json['success'] as bool,
      json['method'] as String,
      id: json['id'] as String?,
      autos: json['data'] as List<dynamic>?,
    );
  }

  @override
  String toString() {
    return 'Response{method: $method\n, success: $success\n, products: $autos\n, id: $id\n}';
  }
}

class Response<E> {
  final E data;
  final String success;
  final String method;

  Response({
    required this.data,
    required this.success,
    required this.method,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
        data: json['data'] as E,
        success: json['method'] as String,
        method: json['method'] as String);
  }

  @override
  String toString() {
    return 'Response{data: $data, method: $method, success: $success}';
  }
}
