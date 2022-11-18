// ignore_for_file: unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../login/stores/login_store/form_store.dart';
import '../repository/register_repository.dart';
import '../store/register_store.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isVisible = true;

  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailRegisterController = TextEditingController();
  final _senhaRegisterController = TextEditingController();

  FormStore formStore = FormStore();

  RegisterController _registerController = RegisterController();
  UsuarioRepository _usuarioRepository = UsuarioRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://static.vecteezy.com/system/resources/previews/002/151/440/original/global-business-network-and-technology-on-blue-background-vector.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Form(
                key: _formKey,
                child: Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Estoque brisanet',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Crie sua conta',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.grey[300]),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Já é registrado?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () {
                              Modular.to.navigate('/login/');
                            },
                            child: Text(
                              'Faça login',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: Colors.grey.withOpacity(.4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: TextFormField(
                                  controller: _usernameController,
                                  validator: (username) {
                                    if (username == null || username.isEmpty) {
                                      return 'Digite o seu nome';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      labelText: 'Nome Completo',
                                      labelStyle:
                                          TextStyle(color: Colors.grey[300]),
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Card(
                          color: Colors.grey.withOpacity(.4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Observer(
                                builder: (_) {
                                  return TextFormField(
                                    controller: _emailRegisterController,
                                    validator: (email) {
                                      if (email == null || email.isEmpty) {
                                        return 'Digite o seu e-mail';
                                      }
                                      return null;
                                    },
                                    onChanged: (email) {
                                      formStore.setEmail(email);
                                    },
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        errorText: formStore.error.email,
                                        labelText: 'E-mail',
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            Icons.email,
                                            color: Colors.grey[300],
                                          ),
                                          onPressed: () {},
                                        ),
                                        labelStyle:
                                            TextStyle(color: Colors.grey[300]),
                                        border: InputBorder.none),
                                  );
                                },
                              )),
                        ),
                      ),
                      Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: TextFormField(
                            controller: _senhaRegisterController,
                            validator: (senha) {
                              if (senha == null || senha.isEmpty) {
                                return 'Digite sua senha';
                              } else if (senha.length < 6) {
                                return 'A senha deve conter mais de 6 caracteres';
                              }
                              return null;
                            },
                            onChanged: (password) {
                              formStore.setPassword(password);
                            },
                            style: TextStyle(color: Colors.white),
                            obscureText: isVisible,
                            decoration: InputDecoration(
                                errorText: formStore.error.password,
                                labelText: 'Senha',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey[300],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                ),
                                labelStyle: TextStyle(color: Colors.grey[300]),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: 170,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.grey[600]!,
                                      Colors.grey[800]!
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text(
                                  'Administrador',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          InkWell(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                bool create =
                                    await _registerController.criarUsuario(
                                        _usernameController.text,
                                        _emailRegisterController.text,
                                        _senhaRegisterController.text);
                              }
                            },
                            child: Container(
                              height: 50,
                              width: 170,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.lightBlueAccent,
                                      Colors.blueAccent
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text(
                                  'Criar conta',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}
