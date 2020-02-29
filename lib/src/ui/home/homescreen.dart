import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_siswa_laravel/src/api/api_service.dart';
import 'package:flutter_siswa_laravel/src/model/siswa.dart';
//import 'package:flutter_siswa_laravel/src/ui/formadd/form_add_screen.dart';

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
    this.context = context;
    return SafeArea(
      child: FutureBuilder(
        future: apiService.getSiswa(),
        builder: (BuildContext context, AsyncSnapshot<List<Siswa>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
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

  Widget _buildListView(List<Siswa> siswas) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          Siswa siswa = siswas[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      siswas[index].name,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text(siswas[index].name),
                    Text(siswas[index].alamat.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
//                        FlatButton(
//                          onPressed: () {
//                            showDialog(
//                                context: context,
//                                builder: (context) {
//                                  return AlertDialog(
//                                    title: Text("Warning"),
//                                    content: Text(
//                                        "Are you sure want to delete data profile ${siswa.name}?"),
//                                    actions: <Widget>[
//                                      FlatButton(
//                                        child: Text("Yes"),
//                                        onPressed: () {
//                                          Navigator.pop(context);
//                                          apiService
////                                              .deleteProfile(profile.id)
//                                              .then((isSuccess) {
//                                            if (isSuccess) {
//                                              setState(() {});
//                                              Scaffold.of(this.context)
//                                                  .showSnackBar(SnackBar(
//                                                  content: Text(
//                                                      "Delete data success")));
//                                            } else {
//                                              Scaffold.of(this.context)
//                                                  .showSnackBar(SnackBar(
//                                                  content: Text(
//                                                      "Delete data failed")));
//                                            }
//                                          });
//                                        },
//                                      ),
//                                      FlatButton(
//                                        child: Text("No"),
//                                        onPressed: () {
//                                          Navigator.pop(context);
//                                        },
//                                      )
//                                    ],
//                                  );
//                                });
//                          },
//                          child: Text(
//                            "Delete",
//                            style: TextStyle(color: Colors.red),
//                          ),
//                        ),
//                        FlatButton(
//                          onPressed: () {
//                            Navigator.push(context,
//                                MaterialPageRoute(builder: (context) {
//                                  return FormAddScreen(profile: profile);
//                                }));
//                          },
//                          child: Text(
//                            "Edit",
//                            style: TextStyle(color: Colors.blue),
//                          ),
//                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: siswas.length,
      ),
    );
  }
}