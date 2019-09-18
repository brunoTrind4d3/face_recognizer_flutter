import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PassageiroTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  PassageiroTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
      title: Text(snapshot.data["nome"]),
      subtitle: Text(snapshot.documentID),
      trailing: Icon(snapshot.data['embarcou']?Icons.assignment_turned_in:Icons.assignment_late),
    );
  }
}
