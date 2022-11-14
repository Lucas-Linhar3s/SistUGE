// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on _RegisterControllerBase, Store {
  late final _$nomeAtom =
      Atom(name: '_RegisterControllerBase.nome', context: context);

  @override
  String? get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String? value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$criarUsuarioAsyncAction =
      AsyncAction('_RegisterControllerBase.criarUsuario', context: context);

  @override
  Future<bool> criarUsuario(dynamic nome, dynamic email, dynamic senha) {
    return _$criarUsuarioAsyncAction
        .run(() => super.criarUsuario(nome, email, senha));
  }

  @override
  String toString() {
    return '''
nome: ${nome}
    ''';
  }
}
