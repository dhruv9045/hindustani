import 'package:Hindustani/entities/json_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final User user;
  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    child: new CachedNetworkImage(
                      imageUrl: user.picture,
                      placeholder:(context, url) => Container(child: Center(child: CircularProgressIndicator(),)),
                    ),
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              Text("BRAND :- "+ user.brand, style: TextStyle(fontSize: 20),),
              Text("BASED IN :- "+ user.based, style: TextStyle(fontSize: 20),),
              Text("MANUFACTURING :- "+ user.manf, style: TextStyle(fontSize: 20),),
              Text("COMPANY :- "+ user.company, style: TextStyle(fontSize: 20),),
              Text("OTHER INFO :- "+ user.other, style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }
}
