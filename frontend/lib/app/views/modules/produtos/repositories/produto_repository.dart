// ignore_for_file: unused_local_variable, override_on_non_overriding_member

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interface/produto_interface.dart';
import '../models/produto_model.dart';

class ProdutoRepository implements ProdutoInterface {
  late List<ProdutoModel> listProduto;

  String apiUrl = 'http://localhost:3333/';

  final Dio _dio = Dio();

  @override
  Future<bool> cadastrarProduto(
      String nome, String dataUltCompra, String ultPreco) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    bool success = true;
    var tokenCreate = await _sharedPreferences.getString('token');
    ProdutoModel produtoModel = ProdutoModel(
        nome: nome, dt_ult_compra: dataUltCompra, ult_preco: ultPreco);
    final apiResponse = await _dio.post(
      'http://localhost:3333/produtos',
      data: produtoModel.toJson(),
      options: Options(
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        headers: {
          'authorization': 'Bearer $tokenCreate',
        },
      ),
    );

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
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    var tokenCreate = await _sharedPreferences.getString('token');

    final apiResponse = await _dio.get(
      'http://localhost:3333/produtos',
    );
    return (apiResponse.data as List)
        .map((item) => ProdutoModel.fromJson(item))
        .toList();
  }

  @override
  Future<List<ProdutoModel>> getAllProdutos() async {
    List<ProdutoModel> produtos = [];

    var apiResponse = await _dio.post('http://localhost:3333/produtos');

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
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    var tokenCreate = await _sharedPreferences.getString('token');
    var data = ProdutoModel(
        nome: nome, dt_ult_compra: dataUltCompra, ult_preco: ultPreco);

    final apiResponse = await _dio.put(
      'http://localhost:3333/produtos/${id}',
      data: data.toJson(),
      options: Options(
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        headers: {
          'authorization': 'Bearer $tokenCreate',
        },
      ),
    );

    if (apiResponse.statusCode == 200) {
      success = true;
    } else {
      success = false;
    }
    return success;
  }

  @override
  Future<bool> excluirProduto(int id) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    var tokenCreate = await _sharedPreferences.getString('token');
    bool success = false;

    ProdutoModel produtoModel = ProdutoModel(
      id: id,
    );

    final apiResponse = await _dio.delete(
      'http://localhost:3333/produtos/$id',
      data: produtoModel.toJson(),
      options: Options(
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        headers: {
          'authorization': 'Bearer $tokenCreate',
        },
      ),
    );

    if (apiResponse.statusCode == 200) {
      print(apiResponse.data);
      success = true;
    } else {
      success = false;
    }
    return success;
  }
}
