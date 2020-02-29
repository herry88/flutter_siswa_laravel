import 'package:http/http.dart' show Client;
import 'package:flutter_siswa_laravel/src/model/siswa.dart';

class ApiService{
  final String baseUrl = "http://192.168.1.12/api/public/api/";
  Client client = Client();

  Future<List<Siswa>> getSiswa() async {
    final response = await client.get("$baseUrl/siswa");
    if (response.statusCode == 200) {
      return siswaFromJson(response.body);
    } else {
      return null;
    }
  }

}

