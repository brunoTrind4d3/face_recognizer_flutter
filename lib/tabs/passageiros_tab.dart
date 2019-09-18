import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reconhecedor_facial_flutter/tiles/passageiro_tile.dart';

class PassageirosTab extends StatelessWidget {
  final PageController pageController;
  final String string;

  PassageirosTab(this.pageController, this.string);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("viagens").document(string).collection('passageiros').getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          return ListView(
              children: snapshot.data.documents.map((doc) {
            return PassageiroTile(doc);
          }).toList());
        }
      },
    );
  }
}
