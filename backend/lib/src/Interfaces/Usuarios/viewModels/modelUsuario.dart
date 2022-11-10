class ModelUsuarios {
  final int? id;
  final String nome;
  final String email;
  final String senha;
  final bool? isAdmin;

  ModelUsuarios({this.id, required this.nome, required this.email, required this.senha, this.isAdmin});
}
