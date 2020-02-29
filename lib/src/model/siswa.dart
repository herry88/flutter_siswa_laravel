import 'dart:convert';

class Siswa {
  int id;
  String name;
  String alamat;


  Siswa({this.id, this.name, this.alamat});

  factory Siswa.fromJson(Map<String, dynamic> map) {
    return Siswa(
        id: map["id"], name: map["name"], alamat: map["alamat"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "alamat": alamat};
  }

  @override
  String toString() {
    return 'Siswa{id: $id, name: $name, alamat: $alamat}';
  }

}

List<Siswa> siswaFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Siswa>.from(data.map((item) => Siswa.fromJson(item)));
}

String siswaToJson(Siswa data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
