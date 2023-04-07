import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Recipe {
  final int id;
  final String name;

  Recipe({required this.id, required this.name});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
    );
  }

}

class RecipeGridView extends StatelessWidget {


Future<List<Recipe>> fetchRecipes() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => Recipe.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch recipes');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Recipe>>(
        future: fetchRecipes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final recipe = snapshot.data![index];
                return Card(
                  child: InkWell(
                    onTap: () {
                      // Navigate to recipe detail screen
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(recipe.name),
                        Text('ID: ${recipe.id}'),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const Center(child:  CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
