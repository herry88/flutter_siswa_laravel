import 'package:flutter/material.dart';
import 'package:flutter_siswa_laravel/src/api/api_service.dart';
import 'package:flutter_siswa_laravel/src/model/siswa.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BuildContext context;
  ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
//        ApiService().getSiswa().then((value) => print("value : $value"))
    this.context = context;
    return SafeArea(
      child: FutureBuilder(
        future: apiService.getSiswa(),
        builder: (BuildContext context, AsyncSnapshot<List<Siswa>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: new Text(
                  "Something Wrong with Message : ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Siswa> siswas = snapshot.data;
            return _buildListView(siswas);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Widget _buildListView(List<Siswa> siswas) {
  return new Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: ListView.builder(itemBuilder: (context, index) {
      Siswa siswa = siswas[index];
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              siswa.name,
              style: Theme.of(context).textTheme.title,
            )
          ],
        ),
      );
    }),
  );
}
