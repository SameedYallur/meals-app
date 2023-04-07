import 'package:flutter/material.dart';

import '../widgets/food_card.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
       children :[ 
        FoodCard(
  dishName: "Pizza",
  imageUrl: "https://www.example.com/images/pizza.jpg",
)
]
      ),
    );
  }
}