import 'package:flutter/material.dart';

SizedBox buildSizedBox(pays) {
  return SizedBox(
    height: 160,
    child: Card(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${pays?.town}",
                    textScaleFactor: 1.5,
                  ),
                  Text("${pays?.country}"),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${pays?.temperature}°C",
                    textScaleFactor: 3,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    "http://127.0.0.1:9090/img/${pays?.image}",
                    height: 100,
                    width: 100,
                    fit: BoxFit.fitWidth,
                  )
                ],
              ))
        ],
      ),
    ),
  );
}
