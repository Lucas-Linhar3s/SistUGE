import 'dart:convert';

import 'package:backend/src/Interfaces/Usuarios/repository/usuariosRepo.dart';
import 'package:backend/src/Interfaces/Usuarios/viewModels/modelUsuario.dart';
import 'package:backend/src/Services/BCrypt/configBCrypt.dart';
import 'package:backend/src/Services/request_extractor/configExtractor.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

final _repository = IUsuariosRepo();
final _extractor = RequestExtractor();
final _BCrypt = ConfigBCrypt();

class IUsuarioController extends Resource {
  @override
  List<Route> get routes => [
        // Create new user.
        Route.post('/usuarios', _criarUsuarios),
        Route.delete('/usuarios/:id', _deleteUsuarios),
      ];

  Future<Response> _criarUsuarios(ModularArguments req) async {
    final email = req.data['email'];
    final senha = req.data['senha'].toString();
    final bool emailIsValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailIsValid && senha.length > 8) {
      ModelUsuarios usuarios = ModelUsuarios(
          nome: req.data['nome'],
          email: email,
          senha: _BCrypt.generateBCrypt(password: senha),
          isAdmin: req.data['isAdmin']);
      final result = _repository.criarUsuario(usuarios);
      if (result != 0) {
        final map = {
          'Sucesso': ['Usuario criado com sucesso! id: $result']
        };
        return Response(201, body: jsonEncode(map));
      }
    }
    final map = {
      'Error': ['email não é valido ou ja existe ou senha é muito curta']
    };
    return Response(500, body: jsonEncode(map));
  }

//   Future<Response> _putUsuarios(ModularArguments req) async {
//     ModelUsuarios Usuarios = ModelUsuarios(
//         id: req.data['id'], nome: req.data['nome'], email: req.data['email']);
//     final result = _repository.putUsuario(Usuarios);
//     if (result != 0) {
//       final map = {
//         'message': 'Usuario com id: ${Usuarios.id} foi atualizado com sucesso!'
//       };
//       return Response(200, body: jsonEncode(map), headers: _jsonEncode);
//     } else {
//       final map = {
//         'message': 'Erro ao tentar atualizar usuario com id: ${Usuarios.id}!'
//       };
//       return Response(500, body: jsonEncode(map), headers: _jsonEncode);
//     }
//   }

//   Future<Response> _putSenha(ModularArguments req) async {
//     ModelUsuarios usuario =
//         ModelUsuarios(id: req.data['id'], senha: req.data['senha']);

//     final result = _repository.putSenhaUsuario(usuario);
//     if (result != 0) {
//       final map = {'success': 'Senha atualizada com sucesso!'};
//       return Response(200, body: jsonEncode(map), headers: _jsonEncode);
//     }
//     final map = {
//       'Error': 'erro ao tentar atualizar senha do usuario id: ${usuario.id}'
//     };
//     return Response(500, body: jsonEncode(map), headers: _jsonEncode);
//   }

  Future<Response> _deleteUsuarios(
      ModularArguments req, Request request) async {
    final id = int.parse(req.params['id']);
    final token = _extractor.getAuthorizationBearer(request);

    final result = _repository.deleteUsuario(id, token);
    if (result != 0) {
      final map = {'sucesso': 'Usuario com id: $id foi excluido com sucesso'};
      return Response(200, body: jsonEncode(map));
    }
    final map = {'error': 'erro ao tentar excluir usuario com id: $id!'};
    return Response(404, body: jsonEncode(map));
  }
}
