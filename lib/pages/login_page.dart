import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = " ";

  int flag = 0;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/deep_purple.png",
                fit: BoxFit.cover,
                height: 300,
              ),
              Text(
                "Welcom $name",
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        name = value;

                        setState(() {});
                      },
                      decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 3)),
                          hintText: "Enter Name..",
                          labelText: "Name",
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1), fontSize: 17)),
                      validator: (value) {
                        //validation for character

                        for (int i = 0; i < value!.length; i++) {
                          if (value[i].codeUnitAt(0) <= 'z'.codeUnitAt(0) &&
                              value[i].codeUnitAt(0) >= 'a'.codeUnitAt(0)) {
                            flag = 0;
                          } else {
                            return "valid char('a' To 'z' only small)";
                          }
                        }

                        //

                        if (value.isEmpty) {
                          return "Name can't be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 3)),
                          hintText: "Enter Password..",
                          labelText: "Password",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 17)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password can't be empty";
                        } else if (value.length < 6) {
                          return "Password Should be 6 or more char.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.deepPurple),
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),

                    // ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //         backgroundColor:
                    //             const Color.fromARGB(255, 82, 32, 231),
                    //         minimumSize: const Size(100, 40)),
                    //     onPressed: () {
                    //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //     },
                    //     child: const Text(
                    //       "Login",
                    //       style: TextStyle(fontSize: 16),
                    //     )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
