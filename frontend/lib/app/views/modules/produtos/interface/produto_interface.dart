import '../models/produto_model.dart';

abstract class ProdutoInterface {
  Future<bool> cadastrarProduto(
      String name, String quantidade, String localidade, String dataUltCompra, String ultPreco, String entrada, String saida);

  Future<bool> editarProduto(
      int id, String name, String quantidade, String localidade, String dataUltCompra, String ultPreco, String entrada, String saida);
  Future<List<ProdutoModel>> listarProdutos();
  Future<List<ProdutoModel>> getAllProdutos();
}
