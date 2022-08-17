import 'package:apiclassonline/models/user_models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

getUsers () async {
  var url = Uri.parse("https://maaz-api.tga-edu.com/api/users");
  var response = await http.get(url);
  var responseData = jsonDecode(response.body);
  return UserModel.fromJson(responseData);
}
