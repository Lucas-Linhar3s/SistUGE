import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../repository/register_repository.dart';
part 'register_store.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {

  UsuarioRepository usuarioRepository = UsuarioRepository();

  @observable
  String? nome = '';
  String? email = '';
  String? senha = '';

  @action
  Future<bool> criarUsuario(nome, email, senha) async {
    bool success = false;
    try {
      var res = await usuarioRepository.cadastrarUsuario(
          nome, email, senha);
      success = true;
      return res;
    } on DioError catch (err) {
      print('Erro ao realizar o cadastro ${err.response?.statusCode}');
    }
    return success;
  }
}