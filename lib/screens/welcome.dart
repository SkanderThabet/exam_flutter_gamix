import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Bienvenue à ESPRIT Météo",
                textScaleFactor: 4,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/pays");
                        },
                        child: const Text(
                          "Choisir mon pays",
                          textScaleFactor: 1.5,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
