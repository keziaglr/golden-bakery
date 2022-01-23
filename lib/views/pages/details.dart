import 'package:flutter/material.dart';
import 'package:qualification_flutter/models/comment.dart';
import 'package:qualification_flutter/models/product.dart';
import 'package:qualification_flutter/utils/globals.dart' as globals;

class DetailPage extends StatefulWidget {
  DetailPage(this.img, this.name, this.price);
  String img;
  String name;
  String price;
  @override
  State<StatefulWidget> createState() {
    return DetailPageState(img, name, price);
  }
}

class DetailPageState extends State<DetailPage> {
  var _ctrlComment = TextEditingController();
  DetailPageState(this.img, this.name, this.price);
  String img;
  String name;
  String price;

  List<Comment> comments = [];

  void _onPressed([context]) {
    if (_ctrlComment.text.trim() == "") {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Comment / Review must not be empty!')));
    } else {
      setState(() {
        globals.comments.add(Comment(name, globals.userNow, _ctrlComment.text));
        _ctrlComment.clear();
      });
    }
  }

  Widget _buildWidget(Comment comments) {
    for (var i = 0; i < globals.comments.length; i++) {
      if (comments.product.toString() == name) {
        return Card(
          elevation: 10,
          child: ListTile(
            leading: Icon(
              Icons.person_rounded,
              size: 50,
            ),
            title: Text(comments.username),
            subtitle: Text(comments.comment),
            trailing: Icon(
              Icons.favorite_rounded,
              color: Colors.pink,
            ),
          ),
        );
      }
    }
    return Card();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[600],
            leading: IconButton(
              icon: Icon(Icons.chevron_left_rounded),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              'Detail Page',
              style:
                  TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700),
            ),
            actions: [Icon(Icons.share_rounded), Icon(Icons.more_vert_rounded)],
            bottom: TabBar(
              unselectedLabelColor: Colors.grey[500],
              tabs: [
                Tab(text: 'Product', icon: Icon(Icons.bakery_dining_rounded)),
                Tab(
                    text: 'Reviews/Comments',
                    icon: Icon(Icons.reviews_rounded)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Column(
                children: [
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                      child: Column(children: [
                        Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 20,
                            child: ListTile(
                                title: Column(children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minHeight: 300,
                                      minWidth: 400,
                                      maxHeight: 300,
                                      maxWidth: 400,
                                    ),
                                    child: Image.asset(
                                      'assets/$img',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20))
                                ]),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(price),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star_rounded,
                                          color: Colors.yellow,
                                        ),
                                        Icon(
                                          Icons.star_rounded,
                                          color: Colors.yellow,
                                        ),
                                        Icon(
                                          Icons.star_rounded,
                                          color: Colors.yellow,
                                        ),
                                        Icon(
                                          Icons.star_rounded,
                                          color: Colors.yellow,
                                        ),
                                        Icon(
                                          Icons.star_rounded,
                                          color: Colors.yellow,
                                        )
                                      ],
                                    )
                                  ],
                                ))),
                      ])),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: TextField(
                      controller: _ctrlComment,
                      decoration: InputDecoration(
                        labelText: 'Review / Comment',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () => _onPressed(context),
                            icon: Icon(Icons.send_rounded)),
                      ),
                    ),
                  )
                ],
              ),
              ListView(
                  children:
                      globals.comments.map((e) => _buildWidget(e)).toList())
            ],
          ),
        ));
  }
}
