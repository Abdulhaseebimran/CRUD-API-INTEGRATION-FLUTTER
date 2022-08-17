import 'package:http/http.dart' as http;

deleteUser({required id}) async {
  var url = Uri.parse("https://maaz-api.tga-edu.com/api/users/$id");
  await http.delete(
    url,
    headers: {'Content-Type': 'application/json'},
  );
}