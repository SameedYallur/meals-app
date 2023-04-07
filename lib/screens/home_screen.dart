import 'dart:convert';

import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/cgt_drawer.dart';
import 'package:frontend/screens/drawer.dart';
import 'package:frontend/services/home.dart';
import 'package:frontend/utils/colors.dart';
// import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {


  // const Home({super.key});
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
//flappy search bar
class _HomeState extends State<Home> {

  Future<List<Recipe>> searchRecipes(String? query) async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/search/?q=$query'));

  if (response.statusCode == 200) {
    final List<dynamic> responseData = json.decode(response.body);
    final List<Recipe> recipes = responseData.map((json) => Recipe.fromJson(json)).toList();
    return recipes;
  } else {
    throw Exception('Failed to search for recipes');
  }
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
final SearchBarController<Recipe> _searchBarController = SearchBarController();
final TextEditingController _searchQueryController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: MyDrawer(),
        // body: RecipeGridView(),
        appBar: AppBar(
          // title: Text('Meals app'),
        backgroundColor:primaryColor, // Set the app bar color
        iconTheme: IconThemeData(color: Colors.white), // Set the icon color
        
        ),
        body: SafeArea(
          // child:const Text("home screen"),
        child: SearchBar<Recipe>(
        onSearch: searchRecipes,
        //(query) {
        //         // query = _searchBarController.query; // set the text of the controller to the query string
        //       return searchRecipes(query);
        //     },
          onItemFound: (Recipe? recipe, int index) {
             return ListTile(
                title: Text(recipe!.name),
                subtitle: Text(recipe.name),
                onTap: () {
                  // Handle tapping a search result item
                },
              );
          },
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          searchBarController: _searchBarController,
          // controller: _searchQueryController,
          hintText: 'Search for recipes',
          // cancellationWidget: Text('Cancel'),
          emptyWidget: Text('No recipes found'),
          // indexedScaledTileBuilder: (int index) => ScaledTile.count(1, index % 2 == 0 ? 2 : 1),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          loader: Center(child: CircularProgressIndicator()),
          placeHolder: Center(child: Text('Enter a search term')),
          // onCancelled: () {
          //   print('Search cancelled');
          // },
          // onError: (error) {
          //   print('Error occurred while searching: $error');
          // },
        ),
      ),
        
        bottomNavigationBar:
            BottomNavigationBar(selectedItemColor: darkGray,
            unselectedItemColor:primaryColor,
              items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),  
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'Near by',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store_outlined),
            label: 'Grocery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites',
          ),
        ]),
      ),
    );
    // return Container();
  }
}
