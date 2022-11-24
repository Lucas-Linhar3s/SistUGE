// import 'package:flutter/material.dart';

// import '../views/data_table/produtos_table.dart';

// class ProdutoModel {
//   String? id;
//   String? nome;
//   String? dt_ult_compra;
//   String? ult_preco;

//   ProdutoModel({
//     this.id,
//     this.nome,
//     this.dt_ult_compra,
//     this.ult_preco,
//   });

//   factory ProdutoModel.fromJson(Map<String, dynamic> json) {
//     return ProdutoModel(
//       id: json["id"],
//       nome: json['nome'],
//       dt_ult_compra: json['dt_ult_compra'],
//       ult_preco: json['ult_preco'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'nome': nome,
//       'dt_ult_compra': dt_ult_compra,
//       'ult_preco': ult_preco,
//     };
//   }

//   DataRow getRow(
//     SelectedCallBack callback,
//     List<String> selectedIds,
//   ) {
//     return DataRow(cells: [
//       DataCell(Text(nome!)),
//       DataCell(Text(dt_ult_compra!)),
//       DataCell(Text(ult_preco!)),
//     ]);
//   }
// }

import 'package:flutter/material.dart';

import '../views/data_table/produtos_table.dart';

class ProdutoModel {
  int? id;
  String nome;
  int dt_ult_compra;
  double ult_preco;

  ProdutoModel({
    this.id,
    required this.nome,
    required this.dt_ult_compra,
    required this.ult_preco,
  });

  factory ProdutoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
      id: json["id"],
      nome: json['nome'],
      dt_ult_compra: json['dt_ult_compra'],
      ult_preco: json['ult_preco'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'dt_ult_compra': dt_ult_compra,
      'ult_preco': ult_preco,
    };
  }

  DataRow getRow(
    SelectedCallBack callback,
    List<String> selectedIds,
  ) {
    return DataRow(cells: [
      DataCell(Text(nome)),
      DataCell(Text(dt_ult_compra.toString())),
      DataCell(Text(ult_preco.toString())),
    ]);
  }
}
