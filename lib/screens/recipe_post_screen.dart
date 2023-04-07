import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:http/http.dart' as http;

import 'package:frontend/utils/globals.dart' as globals;

class AddRecipeScreen extends StatefulWidget {

List<Map<String, dynamic>> steps = <Map<String, dynamic>>[];
  AddRecipeScreen({required this.steps});

@override
AddRecipeScreenState createState() => AddRecipeScreenState();
}

class AddRecipeScreenState extends State<AddRecipeScreen> {
final _formKey = GlobalKey<FormState>();
final _ingredients = <Map<String, dynamic>>[];

  String _name = '';
  double _quantity = 0;
  String _unit = '';

  //    List<String> steps = [];
  //   AddRecipeScreenState({
  //   required this.steps,
  // });

  void _addIngredient() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _ingredients.add({
          'name': _name,
          'quantity': _quantity,
          'unit': _unit,
        });
        _name = '';
        _quantity = 0;
        _unit = '';
      });
    }
  }

  Future<void>  _submitIngredients() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _ingredients.add({
          'name': _name,
          'quantity': _quantity,
          'unit': _unit,
        });
      });

String _nameReq = "working";

      Map<String, dynamic> requestBody = {
   'name': _nameReq,
  'ingredients': _ingredients,
  'steps': widget.steps,
};

// var data = {'ingredients': _ingredients, 'steps': widget.steps, 'name': _nameReq};
// var encodedData = jsonEncode(data);

      // print(requestBody);
      // Send a POST request with the ingredients data to the backend
      var url = Uri.parse('http://127.0.0.1:8000/api/');
      var response = await http.post(
       url,
        headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
         'Authorization': 'Token 6297167b94308f561bb6394c594c292b3792c44a',
      },
      // body: jsonEncode({'ingredients': _ingredients,'steps':widget.steps,'name':_name,}),
      body: json.encode(requestBody),
    );  
      // print(widget.steps);
      globals.allData.clear();
      
      print(globals.allData);
      // Clear the form
      setState(() {
        _ingredients.clear();
        _name = '';
        _quantity = 0;
        _unit = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Ingredients'),
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
                  labelText: 'Ingredient Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an ingredient name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a quantity';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _quantity = double.parse(value!);
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Unit',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a unit';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _unit = value!;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _addIngredient,
                child: Text('Add Ingredient'),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _ingredients.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        tileColor: darkOrange,
                        title: Text('${_ingredients[index]['name']}'),
                        subtitle: Text(
                            '${_ingredients[index]['quantity']} ${_ingredients[index]['_unit']}'),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _submitIngredients,
                child: Text('Submit Ingredients'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
