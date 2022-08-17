import 'package:apiclassonline/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert' as convert;
import '../models/user_models.dart';


updateUser({required Data model, required id}) async {
  Uri url = Uri.parse("https://maaz-api.tga-edu.com/api/users/$id");
  await http.put(url,
      headers: {'Content-Type': 'application/json'},
      body: convert.jsonEncode(model.toJson()));
}

updateUserData({required BuildContext context, data, index}) {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  Alert(
      context: context,
      title: "UPDATE API",
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
            updateUser(
                model: Data(
                    name: nameController.text,
                    email: data.data[index].email,
                    username: usernameController.text),
                    id: data.data[index].id);

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Homepage();
            }));
          },
          child: Text(
            "Update".toUpperCase(),
            style: GoogleFonts.lato(fontSize: 20, color: Colors.white)
          ),
        )
      ]).show();
}