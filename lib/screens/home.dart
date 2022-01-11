import 'package:exam_gamix/components/buildSizedBox_home.dart';
import 'package:exam_gamix/controller/pays_controller.dart';
import 'package:exam_gamix/models/pays_model.dart';
import 'package:exam_gamix/repository/pays_repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var paysController = PaysController(PaysRepository());
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PaysModel>>(
        future: paysController.fetchCountries(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              drawer: Drawer(
                child: Column(children: [
                  AppBar(
                    automaticallyImplyLeading: false,
                    title: const Text("Choisir une option"),
                  ),
                  ListTile(
                    title: Row(
                      children: const [
                        Icon(Icons.clear),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Réinitialiser l’application"),
                      ],
                    ),
                    onTap: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.remove("userId");
                      Navigator.pushReplacementNamed(context, "/welcome");
                    },
                  ),
                ]),
              ),
              appBar: AppBar(
                title: const Text("Esprit Météo"),
              ),
              floatingActionButton: buildFloatingActionButton(snapshot),
              body: ListView.builder(
                itemCount: _currentIndex,
                itemBuilder: (context, int index) {
                  var pays = snapshot.data?[index];
                  return buildSizedBox(pays);
                },
              ),
            );
          } else if (snapshot.hasError) {
            return const Icon(Icons.error_outline);
          } else {
            return const CircularProgressIndicator();
          }
        });
  }


  FloatingActionButton buildFloatingActionButton(AsyncSnapshot<dynamic> snapshot) {
    return FloatingActionButton(onPressed: () {
              setState(() {
                if (_currentIndex == snapshot.data?.length - 1) {
                  _currentIndex = 9;
                } else {
                  _currentIndex++;
                }
              });
            },
            child: const Icon(Icons.add),);
  }
}
