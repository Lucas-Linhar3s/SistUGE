class UsuarioModel{
  String? nome;
  String? email;
  String? senha;

  UsuarioModel({
    this.nome,
    this.email,
    this.senha,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json){
    return UsuarioModel(
      email: json['email'],
      nome: json['nome'],
      senha: json['senha'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }

}