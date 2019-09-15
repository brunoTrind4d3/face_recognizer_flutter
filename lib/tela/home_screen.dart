import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 237, 213, 57) ,
        title: Text(
          "Bem vindo!",
          style: TextStyle(
              fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 237, 213, 57),
              Color.fromARGB(255, 230, 230, 230)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50.0),
              ),
              Icon(
                Icons.person_pin,
                size: 100.0,
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Informar Viagem",
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Número Viagem",
                      prefixIcon: Icon(Icons.directions_bus),
                      border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(const Radius.circular(80.0)),
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                ),
              ),
              Padding(
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
                          borderRadius: const BorderRadius.all(const Radius.circular(80.0)),
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                ),
              ),
              Divider(color: Colors.transparent,),
              Container(
                child: FlatButton(
                  padding: EdgeInsets.fromLTRB(125.0, 15.0, 125.0, 15.0),
                  child: Text(
                    "Consultar",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  textColor: Colors.white,
                  onPressed: () {},
                  color: Colors.black,
                  shape: new RoundedRectangleBorder(borderRadius:
                    new BorderRadius.circular(50.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
