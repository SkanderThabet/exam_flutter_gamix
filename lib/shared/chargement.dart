import 'package:exam_gamix/screens/home.dart';
import 'package:exam_gamix/screens/pays_int.dart';
import 'package:exam_gamix/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Chargement extends StatefulWidget {
  const Chargement({Key? key}) : super(key: key);

  @override
  _ChargementState createState() => _ChargementState();
}

class _ChargementState extends State<Chargement> {
  late Future<bool> _session;
  late String route;

  Future<bool> _verifSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("userId")) {
      route = "/pays";
    } else {
      route = "/welcome";
    }
    return true;
  }

  @override
  void initState() {
    _session = _verifSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _session,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (route == "/pays") {
              return const PaysInt();
            } else {
              return const Welcome();
            }
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Exam"),
              ),
              body: const Center(
                child: Loader(),
              ),
            );
          }
        });
  }
}

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 250,
      height: 250,
      child: CircularProgressIndicator(),
    );
  }
}
