import 'dart:convert';

import 'package:backend/src/Interfaces/Produtos/controller/produtoController.dart';
import 'package:backend/src/Interfaces/swagerHandler.dart';
import 'package:backend/src/Services/Database/sqlite.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class ModuleRoutes extends Module {
  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
        Route.resource(IProdutoController()),
        Route.get('/documentation/**', SwaggerHandler),
      ];
}
