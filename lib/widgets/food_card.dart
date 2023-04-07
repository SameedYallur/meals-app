import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String dishName;
  final String imageUrl;

  const FoodCard({required this.dishName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageUrl,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black.withOpacity(0.4),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    dishName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class TwoLabelsSwitcher extends StatefulWidget {
//   @override
//   _TwoLabelsSwitcherState createState() => _TwoLabelsSwitcherState();
// }

// class _TwoLabelsSwitcherState extends State<TwoLabelsSwitcher> {
//   bool _isFirstLabelSelected = true;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Row(
//           children: [
//             Expanded(
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _isFirstLabelSelected = true;
//                   });
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: _isFirstLabelSelected
//                         ? Colors.blue
//                         : Colors.grey.shade300,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                     ),
//                   ),
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                   child: Text(
//                     "First Label",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: _isFirstLabelSelected
//                           ? Colors.white
//                           : Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _isFirstLabelSelected = false;
//                   });
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: !_isFirstLabelSelected
//                         ? Colors.blue
//                         : Colors.grey.shade300,
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(10),
//                     ),
//                   ),
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                   child: Text(
//                     "Second Label",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: !_isFirstLabelSelected
//                           ? Colors.white
//                           : Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 16),
//         _isFirstLabelSelected ? _buildFirstContent() : _buildSecondContent(),
//       ],
//     );
//   }

//   Widget _buildFirstContent() {
//     return Container(
//       padding: EdgeInsets.all(16),
//       color: Colors.blue.shade100,
//       child: Text("First Content"),
//     );
//   }

//   Widget _buildSecondContent() {
//     return Container(
//       padding: EdgeInsets.all(16),
//       color: Colors.blueGrey.shade100,
//       child: Text("Second Content"),
//     );
//   }
// }
