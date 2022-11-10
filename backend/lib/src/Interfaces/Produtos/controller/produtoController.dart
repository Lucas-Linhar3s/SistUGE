import 'dart:async';
import 'dart:convert';

import 'package:backend/src/Interfaces/Produtos/repository/produtoRepository.dart';
import 'package:backend/src/Interfaces/Produtos/viewModels/modelProdutos.dart';
import 'package:backend/src/Interfaces/Produtos/viewModels/queryParams.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

final _repository = IProdutosRepo();

class IProdutoController extends Resource {
  @override
  List<Route> get routes => [
        Route.post('/produtos', _criarProduto),
        Route.get('/produtos', _buscarProdutos)
      ];

  Future<Response> _criarProduto(ModularArguments req) async {
    ModelProdutos produtos = ModelProdutos(
      req.data['nome'],
      req.data['dt_ult_compra'],
      req.data['ult_preco'],
    );
    int result = _repository.criarProdutos(produtos);
    if (result != 0) {
      final map = {
        'Sucesso': ['Produto criado com sucesso! id: $result']
      };
      return Response(201, body: jsonEncode(map));
    }
    final map = {
      'Error': ['erro ao criar produto!']
    };
    return Response(500, body: jsonEncode(map));
  }

  Future<Response> _buscarProdutos(ModularArguments req) async {
    Params params = Params(
      int.parse(req.queryParams['pageSize'].toString()),
      int.parse(req.queryParams['offset'].toString()),
    );
    final result = _repository.buscarProdutos(params);
    if (result.isEmpty == false) {
      final map = {
        'Produtos': [result]
      };
      return Response(200, body: jsonEncode(map));
    }
    final map = {
      'Error': ["error ao buscar produtos"]
    };
    return Response(404, body: jsonEncode(map));
  }

  // Future<Response> _getOneProduct(ModularArguments req) async {
  //   int id = int.parse(req.params['id']);
  //   final result = _repository.getOneProduct(id);
  //   final s = result.map((e) => e).first;
  //   print(s);
  //   if (result.isEmpty == false) {
  //     return Response(200, body: jsonEncode(result), headers: _jsonEncode);
  //   }
  //   final map = {'error': 'Erro ao buscar produtos com id: $id!'};
  //   return Response(404, body: jsonEncode(map), headers: _jsonEncode);
  // }

  // Future<Response> _putProduct(ModularArguments req) async {
  //   ModelProducts products = ModelProducts(
  //     id: int.parse(req.params['id']),
  //     nome: req.data['nome'],
  //     dt_ult_compra: req.data['dt_ult_compra'],
  //     ult_preco: req.data['ult_preco'],
  //   );
  //   final result = _repository.putProduct(products);
  //   if (result != 0) {
  //     final map = {
  //       'message': 'Produto com id: ${products.id} foi atualizado com sucesso!'
  //     };
  //     return Response(200, body: jsonEncode(map), headers: _jsonEncode);
  //   } else {
  //     final map = {
  //       'message': 'Erro ao tentar atualizar produto com id: ${products.id}!'
  //     };
  //     return Response(500, body: jsonEncode(map), headers: _jsonEncode);
  //   }
  // }

  // Future<Response> _deleteProduct(ModularArguments req) async {
  //   final id = int.parse(req.params['id']);
  //   final result = _repository.deleteProduct(id);
  //   if (result != 0) {
  //     final map = {'sucesso': 'Produto com id: $id foi excluido com sucesso'};
  //     return Response(200, body: jsonEncode(map), headers: _jsonEncode);
  //   }
  //   final map = {'error': 'erro ao tentar excluir produto com id: $id!'};
  //   return Response(404, body: jsonEncode(map), headers: _jsonEncode);
  // }
}
