import 'dart:io';

import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

import 'Routes/routes.dart';

class ConfigRouter {
  Handler _moduleHander() {
    return Modular(
      module: ModuleRoutes(),
      middlewares: [
        logRequests(),
      ],
    );
  }

  Future<HttpServer> Connection(
      {required String address, required int port}) async {
    return await io.serve(_moduleHander(), address, port);
  }
}
