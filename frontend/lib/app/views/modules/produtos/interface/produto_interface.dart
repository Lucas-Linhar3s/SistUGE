import '../models/produto_model.dart';

abstract class ProdutoInterface {
  Future<bool> cadastrarProduto(
      String name, String dataUltCompra, String ultPreco);

  Future<bool> editarProduto(
      int id, String name, String dataUltCompra, String ultPreco);
  // Future<bool> excluirProduto(int id);
  Future<List<ProdutoModel>> listarProdutos();
  Future<List<ProdutoModel>> getAllProdutos();
}
