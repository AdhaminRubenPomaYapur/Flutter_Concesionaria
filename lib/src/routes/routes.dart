import 'package:flutter/cupertino.dart';
import 'package:flutter_concesionaria/src/pages/create_page.dart';
import 'package:flutter_concesionaria/src/pages/delete_page.dart';
import 'package:flutter_concesionaria/src/pages/read_page.dart';
import 'package:flutter_concesionaria/src/pages/update_page.dart';

import '../pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (context) => const HomePage(),
    'create': (context) => const CreatePage(),
    'read': (context) => const ReadPage(),
    'update': (context) => const UpdatePage(),
    'delete': (context) => const DeletePage(),
  };
}
