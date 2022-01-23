import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:qualification_flutter/utils/globals.dart' as globals;
import 'package:qualification_flutter/views/pages/items.dart';
import 'package:qualification_flutter/views/pages/login.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: globals.darkTheme
          ? ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.grey,
              fontFamily: 'Poppins')
          : ThemeData(
              brightness: Brightness.light,
              primaryColor: Colors.grey[200],
              primarySwatch: Colors.grey,
              fontFamily: 'Poppins'),
      home: Scaffold(
          appBar: AppBar(
              actions: [
                PopupMenuButton(itemBuilder: (context) {
                  return ['Toggle Theme'].map((e) {
                    return PopupMenuItem(
                        child: TextButton(
                      child: Text('Change Theme'),
                      onPressed: () {
                        setState(() {
                          globals.darkTheme = !globals.darkTheme;
                        });
                      },
                    ));
                  }).toList();
                })
              ],
              title: Row(
                children: [
                  Text(
                    'Hello, ' + globals.userNow + '!',
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.w700),
                  )
                ],
              )),
          drawer: Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: Text(globals.userNow),
                  subtitle: Text(globals.userEmail),
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 40,
                      minWidth: 40,
                      maxHeight: 50,
                      maxWidth: 50,
                    ),
                    child: Image.asset(
                      'assets/profile.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                ListTile(
                  title: TextButton(
                    child: Text(
                      'Home',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) {
                        return HomePage();
                      }));
                    },
                  ),
                  leading: Icon(Icons.home_rounded),
                ),
                ListTile(
                    title: TextButton(
                      child: Text('Items',
                          style:
                              TextStyle(fontFamily: 'Poppins', fontSize: 20)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) {
                          return ItemsPage();
                        }));
                      },
                    ),
                    leading: Icon(Icons.bakery_dining_rounded)),
                ListTile(
                  title: TextButton(
                    child: Text('Logout',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 20)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) {
                        return LoginPage();
                      }));
                    },
                  ),
                  leading: Icon(Icons.logout_rounded),
                ),
              ],
            ),
          ),
          body: Column(children: [
            CarouselSlider(
              items: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                  child: Image(
                    image: AssetImage('assets/brew.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                  child: Image(
                    image: AssetImage('assets/coffee.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                  child: Image(
                    image: AssetImage('assets/shot.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                  child: Image(
                    image: AssetImage('assets/cookies.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ],
              options: CarouselOptions(
                  height: 300,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: Duration(seconds: 4)),
            ),
            SizedBox(
                width: 400,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.grey, width: 2)),
                  elevation: 20,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("About Us",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        subtitle: Text(
                          "Golden Bakery is an international bakery that offers a wide range of bakery products and inventions made with the highest quality ingredients. The key employees are the bakers who make the dough for our products. The Golden Bakery serves not only local people from Indonesia but also international people that come to Indonesia or the tourist. With premium and high-level ingredients, Golden Bakery’s products is guaranteed to have premium quality and the taste is very delicious. ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ])),
    );
  }
}
