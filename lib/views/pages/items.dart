import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qualification_flutter/models/product.dart';
import 'package:qualification_flutter/views/pages/details.dart';
import 'package:qualification_flutter/views/pages/home.dart';
import 'package:qualification_flutter/views/pages/login.dart';
import 'package:qualification_flutter/utils/globals.dart' as globals;

class ItemsPage extends StatelessWidget {
  var _ctx;

  void _onPressed(Product product) {
    Navigator.push(_ctx, MaterialPageRoute(builder: (builder) {
      return DetailPage(product.img, product.name, product.price);
    }));
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
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
              title: Row(
                children: [
                  Text(
                    'Our Items',
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.w700),
                  )
                ],
              ),
              actions: [Icon(Icons.search_rounded)],
            ),
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
                          style:
                              TextStyle(fontFamily: 'Poppins', fontSize: 20)),
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
            body: ListView(
                children:
                    globals.products.map((e) => _buildWidget(e)).toList())));
  }

  Widget _buildWidget(Product product) {
    return Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 50,
            minWidth: 50,
            maxHeight: 60,
            maxWidth: 60,
          ),
          child: Image.asset(
            'assets/${product.img}',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(product.name),
        subtitle: Text(product.price),
        trailing: IconButton(
            icon: Icon(
              Icons.navigate_next_outlined,
            ),
            onPressed: () => _onPressed(product)),
      ),
    );
  }
}
