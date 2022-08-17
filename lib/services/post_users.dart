import 'package:http/http.dart' as http;
import 'dart:convert';

postData() async {
   var url = Uri.parse("https://maaz-api.tga-edu.com/api/users");
  var response = await http.post(url);
  // var responseData = 
}