import 'dart:async';
import 'dart:ffi';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_modular/shelf_modular.dart';
import 'package:shelf_swagger_ui/shelf_swagger_ui.dart';

FutureOr<Response> SwaggerHandler(Request req) {
  final path = '../specs/swagger.yaml';
  final handler = SwaggerUI(
    path,
    title: 'Projeto UGE',
    deepLink: true,
  );
  return handler(req);
}
