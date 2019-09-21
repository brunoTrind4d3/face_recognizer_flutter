import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PassageiroTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  PassageiroTile(this.snapshot);


  @override
  Widget build(BuildContext context) {
    final String foto = snapshot.data['foto'];
    return Card(
      color: (snapshot.data['embarcou']?Color.fromRGBO(64, 135, 64, 95.0): Color.fromRGBO(200, 34, 43, 95.0)),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: foto.isNotEmpty
                          ? NetworkImage(foto)
                          : AssetImage('images/iconePessoa.png'))),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    snapshot.data['nome'].toString().trim(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Text(snapshot.documentID.toString().trim())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
