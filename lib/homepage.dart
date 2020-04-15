import 'package:flutter/material.dart';
import 'package:flutternewsapp/api/food_api.dart';
import 'package:flutternewsapp/login.dart';
import 'package:flutternewsapp/reminders.dart';
import 'package:provider/provider.dart';
import 'auth_notifier.dart';
import 'data.dart';
import 'Register.dart';
import 'newsfeeds.dart';
import 'world_cases.dart';
import 'live_updates.dart';
import 'package:flutternewsapp/count.dart';
import 'precautions.dart';
import 'bibliography.dart';

void notesOpen(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Your List'),
          backgroundColor: Colors.red[400],
        ),
      );
    },
  ));
}

class Need extends StatelessWidget {
  List<Data> data = [
    Data(text: 'Fruits', customor: 'Dhwaj Gupta', category: 'fruits'),
    Data(text: 'MILK', customor: 'Rahul Kushwaha', category: 'Home'),
    Data(text: 'Water Bottles', customor: 'Lakshy Gupta', category: 'Home'),
  ];

  Widget getIcon(list) {
    print(list.category);
    if (list.category == 'Home') {
      return Icon(Icons.local_grocery_store);
    } else if (list.category == 'fruits') {
      return Icon(Icons.free_breakfast);
    } else {
      return Icon(Icons.shopping_basket);
    }
  }

  Widget Cardneed(list) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new ListTile(
              title: new Text(
                list.text,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              leading: getIcon(list),
            ),
            SizedBox(height: 6.0),
            new Divider(
              color: Colors.blue,
              indent: 16.0,
            ),
            Text(list.customor,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    print("Building Homepage");
    return Scaffold(
      appBar: AppBar(
        title: Text(authNotifier.user != null ? 'Welcome ' + authNotifier.user.displayName  : "Homepage", style: TextStyle(fontSize: 20.0),),
        backgroundColor: Colors.blue,
        actions: <Widget>[
//          IconButton(
//            icon: const Icon(Icons.speaker_notes),
//            onPressed: () {
//              notesOpen(context);
//          return signout(authNotifier);
//            },
//          ),
//          FlatButton(
////            color:Colors.green[500],
//            onPressed: () {
//              return signout(authNotifier);
//            },
//            child: Text(
//              "Log Out",
//              style: TextStyle(
//                fontSize: 15,
//                color: Colors.yellow,
//              ),
//            )
//          )
        IconButton(
            icon: const Icon(Icons.power_settings_new),
            onPressed: () {

          return signout(authNotifier);
            },
          ),
        ],
      ),
      body: Column(
          children: data.map((list) {
            return Cardneed(list);
          }).toList()),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Beat Corona',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/beat.png"),
                    fit: BoxFit.cover
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.computer,
              color: Colors.red,),
              title: Text(
                'Register/Login',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => Login()));
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.event_note,
              color: Colors.blue,),
              title: Text(
                'Get News',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                var id = 1;
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new NewsFeedPage(id)));
                // Update the state of the app.
                // ...
              },
            ),

            ListTile(
              leading: Icon(Icons.shop,
                color: Colors.green,),
              title: Text(
                'Nearby Shops',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading:Icon(Icons.location_city,
                color: Colors.orange,) ,
              title: Text('India Cases',
                style: TextStyle(
                  fontSize: 20,
                ),),
              onTap: () {
                  Navigator.push(
                context,
                new MaterialPageRoute(
              builder: (BuildContext context) =>
                  new UserList()));
                },

                // Update the state of the app.
                // ...
            ),
            ListTile(
              leading:Icon(Icons.gps_fixed,
                color: Colors.blue[400],) ,
              title: Text('World Cases',
                style: TextStyle(
                  fontSize: 20,
                ),),
              onTap: () {
                // Update the state of the app.
                // ...

                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new UserList1()));
              },
            ),
            ListTile(
              leading:Icon(Icons.live_tv,
                color: Colors.yellow[600],) ,
              title: Text('Live Updates',
                style: TextStyle(
                  fontSize: 20,
                ),),
              onTap: () {
                // Update the state of the app.
                // ...

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                      title: "Live Updates",
                      selectedUrl: "https://linkpe.in/",
                    )));
              },
            ),
            ListTile(
              leading:Icon(Icons.local_hospital,
                color: Colors.red,) ,
              title: Text('Precautions',
                style: TextStyle(
                  fontSize: 20,
                ),),
              onTap: () {
                // Update the state of the app.
                // ...

                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new InfoScreen()));
              },
            ),
            ListTile(
              leading:Icon(Icons.developer_mode,
                color: Colors.green,) ,
              title: Text('Miscellaneous',
                style: TextStyle(
                  fontSize: 20,
                ),),
              onTap: () {
                // Update the state of the app.
                // ...

                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new Sources()));
              },
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new,
                color: Colors.red,),
              title: Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                return signout(authNotifier);
                // Update the state of the app.
                // ...
              },
            ),
            new Divider(color: Colors.blueGrey,),
            ListTile(
              title: Text("Rahul Kushwaha | Dhwaj Gupta | Lakshy Gupta", style: TextStyle(fontSize: 11.0, color: Colors.grey,), ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:
          IconButton(
            icon: const Icon(Icons.speaker_notes),
            onPressed: () {
              notesOpen(context);
            },
          ),
      ),
    );
  }
}
