abstract class UsuarioInterface{
  Future<bool> cadastrarUsuario(String nome, String email, String senha);
}