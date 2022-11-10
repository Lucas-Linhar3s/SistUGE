import 'package:backend/src/Interfaces/Produtos/repository/produtoRepository.dart';
import 'package:backend/src/Interfaces/Produtos/viewModels/modelProdutos.dart';
import 'package:backend/src/Services/Database/sqlite.dart';
import 'package:backend/src/Services/Router/router.dart';

void main(List<String> args) {
  ConfigRouter().Connection(address: '0.0.0.0', port: 3333).then(
      (value) => print("Servidor conectado com sucesso! port: ${value.port}"));
  ModelProdutos produtos = ModelProdutos('nome', 'dt_ult_compra', 'ult_preco');
  IProdutosRepo().criarProdutos(produtos);
}
