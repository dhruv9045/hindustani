import 'package:Hindustani/entities/json_page.dart';
import 'package:Hindustani/loaders/color_loader_3.dart';
import 'package:Hindustani/pages/detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart'as http;
import 'dart:convert';

class SearchPage extends StatefulWidget {
//  String value;
//  SearchPage({Key key,@required this.value}):super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  Future<List<User>> _getUsers() async {
    var data = await http.get( "https://dhruv9045.github.io/Food_ML/generate.json");

    var jsonData = json.decode( data.body );
    List<User> users = [];
    for (var u in jsonData) {
      User user = User(
          u["index"],
          u["brand"],
          u["company"],
          u["based"],
          u["manf"],
          u["other"],
          u["picture"]
      );
      users.add( user );
    }
    print( users.length );
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black87.withOpacity( 0.8 ), BlendMode.difference ),
            image: AssetImage( 'assets/images/background.jpg' ),
            fit: BoxFit.cover,
          ),
        ),
//        ==============================JSON QUERY CODE BEGIN============================
        child: FutureBuilder(
          future: _getUsers( ),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: new ColorFilter.mode(
                        Colors.black87.withOpacity( 0.8 ),
                        BlendMode.difference ),
                    image: AssetImage( 'assets/images/background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: ColorLoader3( ),
                ),
              );
            }
            else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all( 8.0 ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all( 8.0 ),
                                child: Container(
                                  child: new CachedNetworkImage(
                                    imageUrl: snapshot.data[index].picture,
                                    placeholder:(context, url)=>Container(child: Center(child: CircularProgressIndicator(),)),
                                  ),
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all( 8.0 ),
                                    child: InkWell(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.55,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: <Widget>[
                                            Text( "BRAND :- " +
                                                snapshot.data[index].brand,
                                              style: TextStyle(
                                                  fontWeight: FontWeight
                                                      .bold ),
                                            ),
                                            Text( "COMPANY :- " +
                                                snapshot.data[index].company,
                                              style: TextStyle(
                                                  fontWeight: FontWeight
                                                      .bold ),
                                            ),
                                            Text( "BASED IN :- " +
                                                snapshot.data[index].based,
                                              style: TextStyle(
                                                  fontWeight: FontWeight
                                                      .bold ),
                                            ),
                                            Text( "MANUFACTURING :- " +
                                                snapshot.data[index].manf,
                                              style: TextStyle(
                                                  fontWeight: FontWeight
                                                      .bold ),
                                            ),
                                            Text( "OTHER INFO:- " +
                                                snapshot.data[index].other,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(context,
                                          // Create the SelectionScreen in the next step.
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPage(
                                                      snapshot.data[index]
                                                  )
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          indent: 2,
                          endIndent: 2,
                          thickness: 2,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

