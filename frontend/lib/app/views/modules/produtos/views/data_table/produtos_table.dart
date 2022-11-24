// // ignore_for_file: unused_local_variable

// import 'package:advanced_datatable/advanced_datatable_source.dart';
// import 'package:advanced_datatable/datatable.dart';
// import 'package:cool_alert/cool_alert.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../models/produto_model.dart';

// import '../../stores/product_store.dart';

// class HomeProduto extends StatefulWidget {
//   HomeProduto({super.key});

//   @override
//   State<HomeProduto> createState() => _HomeProdutoState();
// }

// class _HomeProdutoState extends State<HomeProduto> {
//   var rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;
//   final source = ExampleSource();
//   var sortIndex = 0;
//   var sortAsc = true;
//   final searchController = TextEditingController();

//   TableProdutoStore tableController = TableProdutoStore();

//   TextEditingController controllerNome = TextEditingController();
//   TextEditingController controllerUltCompra = TextEditingController();
//   TextEditingController controllerUltPreco = TextEditingController();

//   final _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     searchController.text = '';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(height: 10),
//               Text(
//                 'Tabela de produtos',
//                 style: TextStyle(
//                   fontSize: 25,
//                 ),
//               ),
//               SizedBox(height: 15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.all(10),
//                       child: TextField(
//                         controller: searchController,
//                         decoration: InputDecoration(
//                           labelText: 'Buscar pelo nome do produto',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5.0),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Color(0xff47afc9)),
//                           ),
//                         ),
//                         onSubmitted: (value) {
//                           source.filterServerSide(searchController.text);
//                         },
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () =>
//                         source.filterServerSide(searchController.text),
//                     icon: Icon(Icons.search),
//                   ),
//                   ElevatedButton(
//                     child: Text("Cadastrar Produtos "),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color.fromARGB(255, 76, 175, 80),
//                     ),
//                     onPressed: () {
//                       CoolAlert.show(
//                         width: 500,
//                         confirmBtnText: "Cadastrar",
//                         confirmBtnColor: Color(0xff235b69),
//                         context: context,
//                         type: CoolAlertType.custom,
//                         backgroundColor: Color(0xff235b69),
//                         widget: Form(
//                           key: _formKey,
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Center(
//                                   child: Text(
//                                 "Cadastrar Produto interno",
//                                 style: TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.bold),
//                               )),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               SizedBox(height: 10),
//                               Observer(builder: (_) {
//                                 return TextFormField(
//                                   keyboardType: TextInputType.number,
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'O nome do produto é obrigatório!';
//                                     }
//                                     print(value);
//                                     return null;
//                                   },
//                                   controller: controllerNome,
//                                   decoration: InputDecoration(
//                                     labelText: 'Nome',
//                                     hintText: 'Insira o nome do produto',
//                                     icon: Icon(
//                                       Icons.account_box,
//                                       color: Color(0xff47afc9),
//                                     ),
//                                     // errorText:
//                                     //     controllerTable.validatenome(),
//                                     labelStyle: TextStyle(
//                                         fontSize: 15, color: Color(0xff47afc9)),
//                                     errorStyle: TextStyle(color: Colors.red),
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(5.0),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide:
//                                           BorderSide(color: Color(0xff47afc9)),
//                                     ),
//                                   ),
//                                 );
//                               }),
//                               SizedBox(height: 10),
//                               Observer(
//                                 builder: (_) {
//                                   return TextFormField(
//                                     inputFormatters: [
//                                       FilteringTextInputFormatter.digitsOnly
//                                     ],
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'A data do produto é obrigatória!';
//                                       }
//                                       print(value);
//                                       return null;
//                                     },
//                                     controller: controllerUltCompra,
//                                     decoration: InputDecoration(
//                                       labelText: 'Data da compra',
//                                       hintText:
//                                           'Insira a data de compra do produto',
//                                       icon: Icon(
//                                         Icons.date_range,
//                                         color: Color(0xff47afc9),
//                                       ),
//                                       // errorText:
//                                       //     controllerTable.validatenome(),
//                                       labelStyle: TextStyle(
//                                           fontSize: 15,
//                                           color: Color(0xff47afc9)),
//                                       errorStyle: TextStyle(color: Colors.red),
//                                       border: OutlineInputBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(5.0),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(0xff47afc9)),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                               SizedBox(height: 10),
//                               Observer(builder: (_) {
//                                 return TextFormField(
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.allow(
//                                       RegExp(r'(^\d*\.?\d*)'),
//                                     ),
//                                   ],
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Esse campo é obrigatório!';
//                                     }
//                                     print(value);
//                                     return null;
//                                   },
//                                   controller: controllerUltPreco,
//                                   decoration: InputDecoration(
//                                     labelText: 'Último preço',
//                                     hintText: 'Insira a data do último preço',
//                                     icon: Icon(
//                                       Icons.production_quantity_limits,
//                                       color: Color(0xff47afc9),
//                                     ),
//                                     labelStyle: TextStyle(
//                                         fontSize: 15, color: Color(0xff47afc9)),
//                                     errorStyle: TextStyle(color: Colors.red),
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(5.0),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide:
//                                           BorderSide(color: Color(0xff47afc9)),
//                                     ),
//                                   ),
//                                 );
//                               })
//                             ],
//                           ),
//                         ),
//                         onConfirmBtnTap: () async {
//                           if (_formKey.currentState!.validate()) {
//                             bool create = await tableController.createProduct(
//                                 controllerNome.text,
//                                 controllerUltCompra.text,
//                                 controllerUltPreco.text);

//                             if (create) {
//                               Modular.to.pop();
//                               CoolAlert.show(
//                                   width: 500,
//                                   context: context,
//                                   type: CoolAlertType.success,
//                                   backgroundColor: Color(0xff235b69),
//                                   confirmBtnColor: Color(0xff235b69),
//                                   title: "Sucesso",
//                                   text: "Produto cadastrado com sucesso");

//                               source.reloadPage();
//                             } else {
//                               Modular.to.pop();
//                               CoolAlert.show(
//                                   width: 500,
//                                   context: context,
//                                   type: CoolAlertType.error,
//                                   title: "Falha",
//                                   text:
//                                       "Ocorreu uma falha ao cadastrar o produto");
//                             }
//                           }
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//               AdvancedPaginatedDataTable(
//                 addEmptyRows: true,
//                 source: source,
//                 sortAscending: sortAsc,
//                 sortColumnIndex: sortIndex,
//                 loadingWidget: loadDadosTable,
//                 errorWidget: loadErrosTable,
//                 showFirstLastButtons: true,
//                 rowsPerPage: rowsPerPage,
//                 availableRowsPerPage: [5, 10, 15],
//                 onRowsPerPageChanged: (newRowsPerPage) {
//                   if (newRowsPerPage != null) {
//                     setState(
//                       () {
//                         rowsPerPage = newRowsPerPage;
//                       },
//                     );
//                   }
//                 },
//                 columns: [
//                   DataColumn(
//                     label: Text('Nome do produto'),
//                     onSort: setSort,
//                   ),
//                   DataColumn(
//                     label: Text('Última compra'),
//                   ),
//                   DataColumn(
//                     label: Text('Último preço'),
//                   ),
//                   DataColumn(
//                     label: Text('Editar'),
//                   ),
//                   DataColumn(
//                     label: Text('Excluir'),
//                   ),
//                 ],
//                 getFooterRowText:
//                     (startRow, pageSize, totalFilter, totalRowsWithoutFilter) {
//                   final localizations = MaterialLocalizations.of(context);
//                   var amountText = localizations.pageRowsInfoTitle(
//                     startRow,
//                     pageSize,
//                     totalFilter ?? totalRowsWithoutFilter,
//                     false,
//                   );

//                   if (totalFilter != null) {
//                     amountText += ' Filtrado de ($totalRowsWithoutFilter)';
//                   }
//                   return amountText;
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void setSort(int i, bool asc) => setState(() {
//         sortIndex = i;
//         sortAsc = asc;
//       });

//   Widget loadDadosTable() {
//     return Center(
//       heightFactor: 10,
//       child: CircularProgressIndicator(
//           backgroundColor: Colors.grey, color: Color(0xff47afc9)),
//     );
//   }

//   Widget loadErrosTable() {
//     return Center(heightFactor: 10, child: Text("Carregando dados..."));
//   }
// }

// typedef SelectedCallBack = Function(String id, bool newSelectState);

// class ExampleSource extends AdvancedDataTableSource<ProdutoModel> {
//   List<String> selectedIds = [];
//   String lastSearchTerm = '';

//   final _formKey = GlobalKey<FormState>();

//   @override
//   DataRow getRow(int index) {
//     TextEditingController controllerENome = TextEditingController();
//     TextEditingController controllerEDtUltCompra = TextEditingController();
//     TextEditingController controllerEUltPreco = TextEditingController();

//     final TableProdutoStore controllerProduto = TableProdutoStore();

//     lastDetails!.rows[index];
//     return DataRow(
//       cells: [
//         DataCell(Text("${lastDetails!.rows[index].nome}")),
//         DataCell(Text("${lastDetails!.rows[index].dt_ult_compra}")),
//         DataCell(Text("${lastDetails!.rows[index].ult_preco}")),
//         DataCell(
//           Row(
//             children: [
//               Builder(
//                 builder: (context) {
//                   return IconButton(
//                       tooltip: "Editar",
//                       onPressed: () {
//                         controllerENome.text = lastDetails!.rows[index].nome!;
//                         controllerEDtUltCompra = lastDetails!.rows[index]
//                             .dt_ult_compra! as TextEditingController;
//                         controllerEUltPreco = lastDetails!
//                             .rows[index].ult_preco! as TextEditingController;
//                         CoolAlert.show(
//                           width: 500,
//                           type: CoolAlertType.confirm,
//                           text: "Deseja mesmo editar esse produto?",
//                           title: "Atenção",
//                           cancelBtnText: "Não",
//                           backgroundColor: Color(0xff235b69),
//                           confirmBtnColor: Color(0xff235b69),
//                           confirmBtnText: "Sim, editar",
//                           context: context,
//                           widget: Form(
//                             key: _formKey,
//                             child: Column(
//                               children: [
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 TextFormField(
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'O nome do produto é obrigatório';
//                                     }
//                                     return null;
//                                   },
//                                   initialValue: lastDetails!.rows[index].nome,
//                                   controller: controllerENome,
//                                   decoration: InputDecoration(
//                                     labelText: 'Nome do produto',
//                                     icon: Icon(
//                                       Icons.account_box,
//                                       color: Color(0xff47afc9),
//                                     ),
//                                     labelStyle: TextStyle(
//                                         fontSize: 15, color: Color(0xff47afc9)),
//                                     errorStyle: TextStyle(color: Colors.red),
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(5.0),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide:
//                                           BorderSide(color: Color(0xff47afc9)),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                       icon: Icon(
//                         Icons.edit,
//                         color: Color(0xFF2b798c),
//                       ));
//                 },
//               ),
//             ],
//           ),
//         ),
//         DataCell(
//           Row(
//             children: [
//               Builder(
//                 builder: (context) {
//                   return IconButton(
//                     tooltip: "Excluir",
//                     onPressed: () async {
//                       await CoolAlert.show(
//                           width: 500,
//                           context: context,
//                           type: CoolAlertType.confirm,
//                           text: "Deseja mesmo excluir esse produto?",
//                           title: "Atenção",
//                           cancelBtnText: "Não",
//                           backgroundColor: Color(0xff235b69),
//                           confirmBtnText: "Sim, excluir",
//                           confirmBtnColor: Color(0xff235b69),
//                           onConfirmBtnTap: () async {},
//                           onCancelBtnTap: () {
//                             Modular.to.pop();
//                           });
//                     },
//                     icon: Icon(
//                       Icons.delete,
//                       color: Colors.red,
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   int get selectedRowCount => selectedIds.length;

//   void selectedRow(String id, bool newSelectState) {
//     if (selectedIds.contains(id)) {
//       selectedIds.remove(id);
//     } else {
//       selectedIds.add(id);
//     }
//     notifyListeners();
//   }

//   void filterServerSide(String filterQuery) async {
//     lastSearchTerm = filterQuery.toLowerCase().trim();
//     setNextView();
//   }

//   void reloadPage() async {
//     setNextView();
//   }

//   @override
//   Future<RemoteDataSourceDetails<ProdutoModel>> getNextPage(
//       NextPageRequest pageRequest) async {
//     SharedPreferences _sharedPreferences =
//         await SharedPreferences.getInstance();

//     var tokenCreate = await _sharedPreferences.getString('token');
//     final Dio _dio = Dio();

//     final response = await _dio.get(
//       'http://localhost:3333/produtos',
//       queryParameters: {
//         'offset': pageRequest.offset.toString(),
//         'pageSize': pageRequest.pageSize.toString(),
//         if (lastSearchTerm.isNotEmpty) 'nome': lastSearchTerm,
//       },
//       options: Options(
//         validateStatus: (_) => true,
//         contentType: Headers.jsonContentType,
//         responseType: ResponseType.json,
//         headers: {
//           'authorization': 'Bearer $tokenCreate',
//         },
//       ),
//     );
//     if (response.statusCode == 200) {
//       final data = response.data;

//       return RemoteDataSourceDetails(
//         data['totalRows'] as int,
//         (data['rows'] as List<dynamic>)
//             .map((json) => ProdutoModel.fromJson(json))
//             .toList(),
//         filteredRows: lastSearchTerm.isNotEmpty
//             ? (data['rows'] as List<dynamic>).length
//             : null,
//       );
//     } else {
//       throw Exception('ERROOOOORRRR');
//     }
//   }
// }
// ignore_for_file: unused_local_variable

import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/produto_model.dart';

import '../../stores/product_store.dart';

class HomeProduto extends StatefulWidget {
  HomeProduto({super.key});

  @override
  State<HomeProduto> createState() => _HomeProdutoState();
}

class _HomeProdutoState extends State<HomeProduto> {
  var rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;
  final source = ExampleSource();
  var sortIndex = 0;
  var sortAsc = true;
  final searchController = TextEditingController();

  TableProdutoStore tableController = TableProdutoStore();

  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerUltCompra = TextEditingController();
  TextEditingController controllerUltPreco = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    searchController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                'Tabela de produtos',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          labelText: 'Buscar pelo nome do produto',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff47afc9)),
                          ),
                        ),
                        onSubmitted: (value) {
                          source.filterServerSide(searchController.text);
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        source.filterServerSide(searchController.text),
                    icon: Icon(Icons.search),
                  ),
                  ElevatedButton(
                    child: Text("Cadastrar Produtos "),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 76, 175, 80),
                    ),
                    onPressed: () {
                      CoolAlert.show(
                        width: 500,
                        confirmBtnText: "Cadastrar",
                        confirmBtnColor: Color(0xff235b69),
                        context: context,
                        type: CoolAlertType.custom,
                        backgroundColor: Color(0xff235b69),
                        widget: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                  child: Text(
                                "Cadastrar Produto interno",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(height: 10),
                              Observer(builder: (_) {
                                return TextFormField(
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'O nome do produto é obrigatório!';
                                    }
                                    print(value);
                                    return null;
                                  },
                                  controller: controllerNome,
                                  decoration: InputDecoration(
                                    labelText: 'Nome',
                                    hintText: 'Insira o nome do produto',
                                    icon: Icon(
                                      Icons.account_box,
                                      color: Color(0xff47afc9),
                                    ),
                                    // errorText:
                                    //     controllerTable.validatenome(),
                                    labelStyle: TextStyle(
                                        fontSize: 15, color: Color(0xff47afc9)),
                                    errorStyle: TextStyle(color: Colors.red),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff47afc9)),
                                    ),
                                  ),
                                );
                              }),
                              SizedBox(height: 10),
                              Observer(
                                builder: (_) {
                                  return TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'A data do produto é obrigatória!';
                                      }
                                      print(value);
                                      return null;
                                    },
                                    controller: controllerUltCompra,
                                    decoration: InputDecoration(
                                      labelText: 'Data da compra',
                                      hintText:
                                          'Insira a data de compra do produto',
                                      icon: Icon(
                                        Icons.date_range,
                                        color: Color(0xff47afc9),
                                      ),
                                      // errorText:
                                      //     controllerTable.validatenome(),
                                      labelStyle: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff47afc9)),
                                      errorStyle: TextStyle(color: Colors.red),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff47afc9)),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 10),
                              Observer(builder: (_) {
                                return TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'(^\d*\.?\d*)'),
                                    ),
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Esse campo é obrigatório!';
                                    }
                                    print(value);
                                    return null;
                                  },
                                  controller: controllerUltPreco,
                                  decoration: InputDecoration(
                                    labelText: 'Último preço',
                                    hintText: 'Insira a data do último preço',
                                    icon: Icon(
                                      Icons.production_quantity_limits,
                                      color: Color(0xff47afc9),
                                    ),
                                    labelStyle: TextStyle(
                                        fontSize: 15, color: Color(0xff47afc9)),
                                    errorStyle: TextStyle(color: Colors.red),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff47afc9)),
                                    ),
                                  ),
                                );
                              })
                            ],
                          ),
                        ),
                        onConfirmBtnTap: () async {
                          if (_formKey.currentState!.validate()) {
                            bool create = await tableController.createProduct(
                                controllerNome.text,
                                controllerUltCompra.text,
                                controllerUltPreco.text);

                            if (create) {
                              Modular.to.pop();
                              CoolAlert.show(
                                  width: 500,
                                  context: context,
                                  type: CoolAlertType.success,
                                  backgroundColor: Color(0xff235b69),
                                  confirmBtnColor: Color(0xff235b69),
                                  title: "Sucesso",
                                  text: "Produto cadastrado com sucesso");

                              source.reloadPage();
                            } else {
                              Modular.to.pop();
                              CoolAlert.show(
                                  width: 500,
                                  context: context,
                                  type: CoolAlertType.error,
                                  title: "Falha",
                                  text:
                                      "Ocorreu uma falha ao cadastrar o produto");
                            }
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              AdvancedPaginatedDataTable(
                addEmptyRows: true,
                source: source,
                sortAscending: sortAsc,
                sortColumnIndex: sortIndex,
                loadingWidget: loadDadosTable,
                errorWidget: loadErrosTable,
                showFirstLastButtons: true,
                rowsPerPage: rowsPerPage,
                availableRowsPerPage: [5, 10, 15],
                onRowsPerPageChanged: (newRowsPerPage) {
                  if (newRowsPerPage != null) {
                    setState(
                      () {
                        rowsPerPage = newRowsPerPage;
                      },
                    );
                  }
                },
                columns: [
                  DataColumn(
                    label: Text('Nome do produto'),
                    onSort: setSort,
                  ),
                  DataColumn(
                    label: Text('Última compra'),
                  ),
                  DataColumn(
                    label: Text('Último preço'),
                  ),
                  DataColumn(
                    label: Text('Editar'),
                  ),
                  DataColumn(
                    label: Text('Excluir'),
                  ),
                ],
                getFooterRowText:
                    (startRow, pageSize, totalFilter, totalRowsWithoutFilter) {
                  final localizations = MaterialLocalizations.of(context);
                  var amountText = localizations.pageRowsInfoTitle(
                    startRow,
                    pageSize,
                    totalFilter ?? totalRowsWithoutFilter,
                    false,
                  );

                  if (totalFilter != null) {
                    amountText += ' Filtrado de ($totalRowsWithoutFilter)';
                  }
                  return amountText;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setSort(int i, bool asc) => setState(() {
        sortIndex = i;
        sortAsc = asc;
      });

  Widget loadDadosTable() {
    return Center(
      heightFactor: 10,
      child: CircularProgressIndicator(
          backgroundColor: Colors.grey, color: Color(0xff47afc9)),
    );
  }

  Widget loadErrosTable() {
    return Center(heightFactor: 10, child: Text("Carregando dados..."));
  }
}

typedef SelectedCallBack = Function(String id, bool newSelectState);

class ExampleSource extends AdvancedDataTableSource<ProdutoModel> {
  List<String> selectedIds = [];
  String lastSearchTerm = '';

  final _formKey = GlobalKey<FormState>();

  @override
  DataRow getRow(int index) {
    TextEditingController controllerENome = TextEditingController();
    TextEditingController controllerEDtUltCompra = TextEditingController();
    TextEditingController controllerEUltPreco = TextEditingController();

    final TableProdutoStore controllerProduto = TableProdutoStore();

    lastDetails!.rows[index];
    return DataRow(
      cells: [
        DataCell(Text("${lastDetails!.rows[index].nome}")),
        DataCell(Text("${lastDetails!.rows[index].dt_ult_compra}")),
        DataCell(Text("${lastDetails!.rows[index].ult_preco}")),
        DataCell(
          Row(
            children: [
              Builder(
                builder: (context) {
                  return IconButton(
                      tooltip: "Editar",
                      onPressed: () {
                        controllerENome.text = lastDetails!.rows[index].nome;
                        controllerEDtUltCompra = lastDetails!.rows[index]
                            .dt_ult_compra as TextEditingController;
                        controllerEUltPreco = lastDetails!
                            .rows[index].ult_preco as TextEditingController;
                        CoolAlert.show(
                          width: 500,
                          type: CoolAlertType.confirm,
                          text: "Deseja mesmo editar esse produto?",
                          title: "Atenção",
                          cancelBtnText: "Não",
                          backgroundColor: Color(0xff235b69),
                          confirmBtnColor: Color(0xff235b69),
                          confirmBtnText: "Sim, editar",
                          context: context,
                          widget: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'O nome do produto é obrigatório';
                                    }
                                    return null;
                                  },
                                  initialValue: lastDetails!.rows[index].nome,
                                  controller: controllerENome,
                                  decoration: InputDecoration(
                                    labelText: 'Nome do produto',
                                    icon: Icon(
                                      Icons.account_box,
                                      color: Color(0xff47afc9),
                                    ),
                                    labelStyle: TextStyle(
                                        fontSize: 15, color: Color(0xff47afc9)),
                                    errorStyle: TextStyle(color: Colors.red),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff47afc9)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Color(0xFF2b798c),
                      ));
                },
              ),
            ],
          ),
        ),
        DataCell(
          Row(
            children: [
              Builder(
                builder: (context) {
                  return IconButton(
                    tooltip: "Excluir",
                    onPressed: () async {
                      await CoolAlert.show(
                          width: 500,
                          context: context,
                          type: CoolAlertType.confirm,
                          text: "Deseja mesmo excluir esse produto?",
                          title: "Atenção",
                          cancelBtnText: "Não",
                          backgroundColor: Color(0xff235b69),
                          confirmBtnText: "Sim, excluir",
                          confirmBtnColor: Color(0xff235b69),
                          onConfirmBtnTap: () async {},
                          onCancelBtnTap: () {
                            Modular.to.pop();
                          });
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  int get selectedRowCount => selectedIds.length;

  void selectedRow(String id, bool newSelectState) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    notifyListeners();
  }

  void filterServerSide(String filterQuery) async {
    lastSearchTerm = filterQuery.toLowerCase().trim();
    setNextView();
  }

  void reloadPage() async {
    setNextView();
  }

  @override
  Future<RemoteDataSourceDetails<ProdutoModel>> getNextPage(
      NextPageRequest pageRequest) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    var tokenCreate = await _sharedPreferences.getString('token');
    final Dio _dio = Dio();

    final response = await _dio.get(
      'http://localhost:3333/produtos',
      queryParameters: {
        'offset': pageRequest.offset.toString(),
        'pageSize': pageRequest.pageSize.toString(),
        if (lastSearchTerm.isNotEmpty) 'nome': lastSearchTerm,
      },
      options: Options(
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        headers: {
          'authorization': 'Bearer $tokenCreate',
        },
      ),
    );
    if (response.statusCode == 200) {
      final data = response.data;
      print(data['Produtos'].first["count"]);
      return RemoteDataSourceDetails(
        int.parse(data['Produtos'].first["count"].toString()),
        (data['Produtos'] as List<dynamic>)
            .map((json) => ProdutoModel.fromJson(json))
            .toList(),
        filteredRows: lastSearchTerm.isNotEmpty
            ? (data['Produtos'] as List<dynamic>).length
            : null,
      );
    } else {
      throw Exception('ERROOOOORRRR');
    }
  }
}
