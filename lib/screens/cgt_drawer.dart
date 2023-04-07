import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Column(
                  children: [
                    Spacer(),
                    CircleAvatar(
                      radius: 40,
                      // backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    // Text(
                    //   'Recipe History',
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 16,
                    //   ),
                    // ),
                    Spacer(),
                  ],
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    // TODO: implement settings
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help'),
                  onTap: () {
                    // TODO: implement help
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () {
                    // TODO: implement logout
                  },
                ),
                ListTile(
                  leading: Icon(Icons.dark_mode),
                  title: Text('Dark Mode'),
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {
                      // TODO: implement dark mode switch
                    },
                  ),
                  onTap: () {
                    // TODO: implement dark mode
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}






// import 'package:flutter/material.dart';

// class AppDrawer extends StatefulWidget {
//   const AppDrawer({Key? key}) : super(key: key);

//   @override
//   State<AppDrawer> createState() => _AppDrawerState();
// }

// class _AppDrawerState extends State<AppDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: [
//                 Column(
//                   children: [
//                     Spacer(),
//                     CircleAvatar(
//                       radius: 40,
//                       // backgroundImage: AssetImage('assets/images/profile.png'),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       'John Doe',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     // Text(
//                     //   'Recipe History',
//                     //   style: TextStyle(
//                     //     color: Colors.white,
//                     //     fontSize: 16,
//                     //   ),
//                     // ),
//                     Spacer(),
//                   ],
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.settings),
//                   title: Text('Settings'),
//                   onTap: () {
//                     // TODO: implement settings
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.help),
//                   title: Text('Help'),
//                   onTap: () {
//                     // TODO: implement help
//                   },
//                 ),
//                 Divider(),
//                 ListTile(
//                   leading: Icon(Icons.logout),
//                   title: Text('Logout'),
//                   onTap: () {
//                     // TODO: implement logout
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.dark_mode),
//                   title: Text('Dark Mode'),
//                   trailing: Switch(
//                     value: false,
//                     onChanged: (value) {
//                       // TODO: implement dark mode switch
//                     },
//                   ),
//                   onTap: () {
//                     // TODO: implement dark mode
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
