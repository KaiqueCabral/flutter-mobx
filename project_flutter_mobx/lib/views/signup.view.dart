import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_flutter_mobx/controllers/signup.controller.dart';
import 'package:project_flutter_mobx/stores/app.store.dart';
import 'package:project_flutter_mobx/view-models/signup.viewmodel.dart';
import 'package:project_flutter_mobx/views/home.view.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = new SignupController();
  var model = SignupViewModel();

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter with MobX"),
        centerTitle: true,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.red[50],
        padding: EdgeInsets.all(50),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.indigo[500],
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 30,
                      ),
                    ),
                    _textFormField(
                      "Name",
                      TextInputType.text,
                      (value) {
                        model.name = value;
                      },
                    ),
                    _textFormField(
                      "E-mail",
                      TextInputType.emailAddress,
                      (value) {
                        model.email = value;
                      },
                    ),
                    _textFormField(
                      "Password",
                      TextInputType.visiblePassword,
                      (value) {
                        model.password = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    model.isBusy
                        ? Center(
                            child: Container(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.black,
                              ),
                            ),
                          )
                        : FlatButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();

                                _controller.create(model).then((data) {
                                  store.setUser(
                                    data.name,
                                    data.email,
                                    data.picture,
                                    data.token,
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomeView(),
                                    ),
                                  );
                                });
                              }
                            },
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 10,
                            ),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.indigo[900],
                                fontSize: 24,
                                fontFamily: "Arial",
                              ),
                            ),
                            color: Colors.white,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _textFormField(
    String labelText,
    TextInputType inputType,
    Function(String) onSaved,
  ) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          keyboardType: inputType,
          obscureText: (inputType == TextInputType.visiblePassword),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            errorStyle: TextStyle(
              color: Colors.redAccent[100],
            ),
          ),
          style: TextStyle(
            color: Colors.white,
          ),
          validator: (value) {
            if (value.isEmpty) {
              return "Please, type your $labelText.";
            }
            return null;
          },
          onSaved: onSaved,
        ),
      );
}
