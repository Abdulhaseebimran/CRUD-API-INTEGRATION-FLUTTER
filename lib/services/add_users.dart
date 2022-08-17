import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../models/user_models.dart';
import '../screens/home.dart';

addUser({required Data model}) async {
  Uri url = Uri.parse("https://maaz-api.tga-edu.com/api/users");
  await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: convert.jsonEncode(model.toJson()));
}

// //////////////////////////////////
AddUserData({required BuildContext context}) {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  Alert(
      context: context,
      title: "Add User".toUpperCase(),
      content: Column(
        children: <Widget>[
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Name',
            ),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              labelText: 'Email',
            ),
          ),
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              icon: Icon(Icons.account_circle),
              labelText: 'Username',
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            addUser(
              model: Data(
                  name: nameController.text,
                  email: "email@email.com",
                  username: usernameController.text),
            );

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Homepage();
            }));
          },
          child: Text(
            "ADD".toUpperCase(),
            style: GoogleFonts.lato(fontSize: 20, color: Colors.white
          ),
        ),),
      ]).show();
}