import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:reconhecedor_facial_flutter/tela/function_screen.dart';

class HomeTab extends StatelessWidget {
  final PageController pageController;

  HomeTab(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 237, 213, 57),
              Color.fromARGB(255, 230, 230, 230)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        );
    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  '',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Icon(
                  Icons.person,
                  size: 100.0,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(55.0, 15.0, 55.0, 9.0),
                child: Text(
                  "Informar Viagem",
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 9.0),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Número Viagem",
                      prefixIcon: Icon(Icons.directions_bus),
                      border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(80.0)),
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 9.0),
                child: Container(
                  child: DateTimePickerFormField(
                    inputType: InputType.date,
                    format: DateFormat("dd/MM/yyyy"),
                    editable: false,
                    decoration: InputDecoration(
                      labelText: "Data Viagem",
                      prefixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(80.0)),
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                child: FlatButton(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Consultar",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FunctionScreen(pageController),
                        ));
                  },
                  color: Colors.black,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0)),
                ),
              ),
            )),
          ],
        )
      ],
    );
  }
}
