import 'package:exam_gamix/controller/pays_controller.dart';
import 'package:exam_gamix/models/pays_model.dart';
import 'package:exam_gamix/repository/pays_repository.dart';
import 'package:flutter/material.dart';

class PaysInt extends StatefulWidget {
  const PaysInt({Key? key}) : super(key: key);

  @override
  _PaysIntState createState() => _PaysIntState();
}

class _PaysIntState extends State<PaysInt> {
  var paysController = PaysController(PaysRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choix du pays"),
      ),
      body: FutureBuilder<List<PaysModel>>(
          future: paysController.fetchCountries(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  var pays = snapshot.data?[index];
                  return buildGestureDetector(context, pays);
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  GestureDetector buildGestureDetector(BuildContext context, pays) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, "/home");
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                "http://127.0.0.1:9090/img/${pays?.image}",
                width: 70,
                height: 70,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${pays?.town}',
                    textScaleFactor: 2,
                  ),
                  Text("${pays?.country}")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
