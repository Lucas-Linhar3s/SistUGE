// import 'package:dio/dio.dart';
// import 'package:mobx/mobx.dart';

// import '../produtos/repositories/produto_repository.dart';
// part 'product_store.g.dart';

// class TableProdutoStore = _TableProdutoStoreBase with _$TableProdutoStore;

// abstract class _TableProdutoStoreBase with Store {
//    final ProdutoRepository produtoRepository = ProdutoRepository();

//   @observable
//   String nome = '';
//   String? dataUltCompra = '';
//   String? ultPreco = '';

//   String? validateName() {
//     if (nome.isEmpty) {
//       return "Este campo é obrigatório";
//     }
//     return null;
//   }

//   @computed
//   bool get isValidName {
//     return validateName() == null;
//   }

//   @action
//   Future<bool> createProduct(nome, dataUltCompra, ultPreco) async {
//     bool success = false;
//     try {
//       var res = await produtoRepository.cadastrarProduto(
//           nome);
//       success = true;
//       return res;
//     } on DioError catch (err) {
//       print('Erro ao realizar o cadastro ${err.response?.statusCode}');
//     }
//     return success;
//   }
// }