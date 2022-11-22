import 'package:advanced_datatable/datatable.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:dart_learning/app/views/api/sheets/product_fields.dart';
import 'package:dart_learning/app/views/api/sheets/product_sheets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../produtos/stores/product_store.dart';
import '../../produtos/views/data_table/produtos_table.dart';

class EstoquePage extends StatefulWidget {
  const EstoquePage({super.key});

  @override
  State<EstoquePage> createState() => _EstoquePageState();
}

class _EstoquePageState extends State<EstoquePage> {
  var rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;
  var sortIndex = 0;
  var sortAsc = true;
  final source = ExampleSource();
  final searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  TextEditingController controllerEsNome = TextEditingController();
  TextEditingController controllerEsLocalidade = TextEditingController();
  TextEditingController controllerEsDtEntrada = TextEditingController();
  TextEditingController controllerEsDtSaida = TextEditingController();

  TableProdutoStore tableController = TableProdutoStore();

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
                'Tabela de estoque',
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'O nome do produto é obrigatório!';
                                    }
                                    print(value);
                                    return null;
                                  },
                                  controller: controllerEsNome,
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
                              Observer(builder: (_) {
                                return TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'A localidade do produto é obrigatória!';
                                    }
                                    print(value);
                                    return null;
                                  },
                                  controller: controllerEsNome,
                                  decoration: InputDecoration(
                                    labelText: 'Localidade',
                                    hintText: 'Insira a localidade do produto',
                                    icon: Icon(
                                      Icons.manage_search_sharp,
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
                                    controller: controllerEsDtEntrada,
                                    decoration: InputDecoration(
                                      labelText: 'Data de entrada',
                                      hintText:
                                          'Insira a data de entrada do produto',
                                      icon: Icon(
                                        Icons.date_range_rounded,
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
                                  controller: controllerEsLocalidade,
                                  decoration: InputDecoration(
                                    labelText: 'Data de saída',
                                    hintText:
                                        'Insira a data de saída do produto',
                                    icon: Icon(
                                      Icons.date_range_rounded,
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
                              controllerEsNome.text,
                              controllerEsDtEntrada.text,
                              controllerEsDtSaida.text,
                            );
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
                    label: Text('Localidade'),
                  ),
                  DataColumn(
                    label: Text('Data de entrada'),
                  ),
                  DataColumn(
                    label: Text('Data de saída'),
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
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () async {
                    final produtos = {
                      ProductFields.id: 1,
                      ProductFields.name: 'Jackson',
                      ProductFields.dt_ult_compra: '22112022',
                      ProductFields.ult_preco: '5153.12',
                    };
                    await UserSheetsApi.insert([produtos]);
                  },
                  child: Text('Exportar dados'))
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
