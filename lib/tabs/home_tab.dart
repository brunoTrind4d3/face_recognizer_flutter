import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reconhecedor_facial_flutter/tela/function_screen.dart';

class HomeTab extends StatelessWidget {
  HomeTab(this.pageController);

  final PageController pageController;
  final TextEditingController controllerInput = new TextEditingController();
  final TextEditingController controllerInputData = new TextEditingController();

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> _globalKeyTest = GlobalKey<FormState>();

  void _resetCampos() {
    controllerInput.text = "";
    controllerInputData.text = "";
  }

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
                child: Form(
                  key: _globalKey,
                  child: Container(
                    child: TextFormField(
                      controller: controllerInput,
                      decoration: InputDecoration(
                        labelText: "Número Viagem",
                        prefixIcon: Icon(Icons.directions_bus),
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(80.0)),
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return ('Insira o número da viagem');
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 9.0),
                child: Form(
                  key: _globalKeyTest,
                  child: Container(
                    child: DateTimePickerFormField(
                      controller: controllerInputData,
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
                      validator: (value) {
                        if (value == null) {
                          return ('Insira a data da viagem');
                        }
                      },
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
                      if (_globalKey.currentState.validate() &&
                          _globalKeyTest.currentState.validate()) {
                        retornaDocs(controllerInput, controllerInputData)
                            .then((map) {
                          if (map.data != null) {
                            String str = controllerInput.text.trim() +
                                controllerInputData.text
                                    .trim()
                                    .replaceAll('/', '');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FunctionScreen(
                                      pageController, str),
                                ));
                            _resetCampos();
                          } else {
                            _resetCampos();
                            return;
                          }
                        });
                      }
                    },
                    color: Colors.black,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50.0)),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

Future<DocumentSnapshot> retornaDocs(
    TextEditingController controller, TextEditingController controller2) async {
  DocumentSnapshot snapshot = await Firestore.instance
      .collection('viagens')
      .document(
          controller.text.trim() + controller2.text.trim().replaceAll('/', ''))
      .get();
  controller.value;
  return snapshot;
}
