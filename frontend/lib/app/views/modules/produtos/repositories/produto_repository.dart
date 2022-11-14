// ignore_for_file: override_on_non_overriding_member

import 'dart:convert';

import 'package:dio/dio.dart';

import '../interface/produto_interface.dart';
import '../models/produto_model.dart';

class ProdutoRepository implements ProdutoInterface {
  late List<ProdutoModel> listProduto;
  final Dio _dio = Dio();

  @override
  Future<bool> cadastrarProduto(
      String nome, String dataUltCompra, String ultPreco) async {
    bool success = true;

    ProdutoModel produtoModel = ProdutoModel(
        nome: nome, dt_ult_compra: dataUltCompra, ult_preco: ultPreco);

    final apiResponse = await _dio.post('http://localhost:9090/produtos',
        data: produtoModel.toJson());
    print(apiResponse.data);

    if (apiResponse.statusCode == 201) {
      success = true;
    } else {
      success = false;
    }
    return success;
  }

  @override
  Future<List<ProdutoModel>> listarProdutos() async {
    final apiResponse = await _dio.get('http://localhost:9090/produtos');
    return (apiResponse.data as List)
        .map((item) => ProdutoModel.fromJson(item))
        .toList();
  }

  @override
  Future<List<ProdutoModel>> getAllProdutos() async {
    List<ProdutoModel> produtos = [];

    var apiResponse = await _dio.post('http://localhost:9090/produtos');

    if (apiResponse.statusCode == 200) {
      var pp = apiResponse.data["result"] as List;

      print(jsonEncode(apiResponse.data));
      produtos = pp.map((json) => ProdutoModel.fromJson(json)).toList();
    } else {
      produtos = [];
    }
    return produtos;
  }

  @override
  Future<bool> editarProduto(
      int id, String nome, String dataUltCompra, String ultPreco) async {
    bool success = false;

    var data = ProdutoModel(
        nome: nome, dt_ult_compra: dataUltCompra, ult_preco: ultPreco);

    final apiResponse = await _dio.patch('http://localhost:9090/produtos');

    if (apiResponse.statusCode == 200) {
      success = true;
    } else {
      success = false;
    }
    return success;
  }

  @override
  Future<bool> excluirProduto(int id) async {
    bool success = false;

    ProdutoModel produtoModel = ProdutoModel();

    final apiResponse = await _dio.delete('http://localhost:9090/produtos/$id',
        data: produtoModel.toJson());

    if (apiResponse.statusCode == 200) {
      print(apiResponse.data);
      success = true;
    } else {
      success = false;
    }
    return success;
  }
}
