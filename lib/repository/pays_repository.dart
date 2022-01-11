import 'dart:convert';

import 'package:exam_gamix/models/pays_model.dart';
import 'package:exam_gamix/services/pays_interface_impl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PaysRepository implements PaysInterfaceImpl {
  String baseUrl = 'http://127.0.0.1:9090';

  @override
  Future<List<PaysModel>> getPays() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<PaysModel> pays = [];
    var url = Uri.parse('$baseUrl/country');
    var response = await http.get(url);
    print("Status : ${response.statusCode}");
    var body = json.decode(response.body);
    for (var i = 0; i < body.length; i++) {
      pays.add(PaysModel.fromJsonMap(body[i]));
    }
    preferences.setString("userId", body[0]["_id"]);
    return pays;
  }
}
