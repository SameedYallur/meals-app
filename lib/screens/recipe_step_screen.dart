import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/screens/recipe_post_screen.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/globals.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/utils/globals.dart' as globals;

class AddStepScreen extends StatefulWidget {
  @override
  AddStepScreenState createState() => AddStepScreenState();
}

class AddStepScreenState extends State<AddStepScreen> {
  final _formKey = GlobalKey<FormState>();
  final _Steps = <Map<String, dynamic>>[];

  String step_details = '';

  void _addsteps() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _Steps.add({
          'body': step_details,
        });
        step_details = '';
      });
    }
  }

  Future<void> _submitsteps() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _Steps.add({
          'body': step_details,
        });
      });
      // print(_Steps);
      // Clear the form
      setState(() {
        globals.allData = _Steps;
        // _Steps.clear();
        step_details = '';

      });
      globals.allData.clear();
      print(globals.allData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Steps'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'steps Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the step details';
                  }
                  return null;
                },
                // onSaved: (value) {
                //   _step_count =
                //       value == null || value.isEmpty ? 0 : double.parse(value);
                // },
                onSaved: (value) {
                  step_details = value!;
                },
              ),
              SizedBox(height: 16),
              // Row(
              //   children: <Widget>[
              //   ],
              // ),
              // SizedBox(height: 16),
              ElevatedButton(
                onPressed: _addsteps,
                child: Text('Add steps'),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _Steps.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        tileColor: darkOrange,
                        title: Text('${_Steps[index]['body']}'),
                        subtitle: Text('1'),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _submitsteps,
                child: Text('Submit steps'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddRecipeScreen(steps: globals.allData),
                    ),
                  );
                },
                child: Text('Go to next page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
