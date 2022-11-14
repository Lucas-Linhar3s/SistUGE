import 'package:dart_learning/app/views/modules/register/interface/usuario_interface.dart';
import 'package:dart_learning/app/views/modules/register/model/register_model.dart';
import 'package:dio/dio.dart';

class UsuarioRepository implements UsuarioInterface{
  final Dio _dio = Dio();
  
  @override
  Future<bool> cadastrarUsuario(String nome, String email, String senha) async {
    bool success = true;

    UsuarioModel usuarioModel = UsuarioModel(
        nome: nome, email: email, senha: senha);

    final apiResponse = await _dio.post('http://localhost:3333/usuarios',
        data: usuarioModel.toJson());
    print(apiResponse.data);

    if (apiResponse.statusCode == 201) {
      success = true;
    } else {
      success = false;
    }
    return success;
  }
}