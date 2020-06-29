import 'dart:async';

import 'package:Hindustani/pages/events_page.dart';
import 'package:Hindustani/pages/scan_product.dart';
import 'package:Hindustani/pages/search_page.dart';
import 'package:Hindustani/pages/settings_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomeMenu(),
    );
  }
}
class MyHomeMenu extends StatefulWidget {
  @override
  _MyHomeMenuState createState() => _MyHomeMenuState();
}

class _MyHomeMenuState extends State<MyHomeMenu> with SingleTickerProviderStateMixin{

  TabController  _tabController;

  TextEditingController _controller = TextEditingController();


  Timer _debounce;
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this,initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    extendBodyBehindAppBar: false,
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0.0,
        title: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top:10.0,bottom: 5.0),
                child: Container(
                  margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search Brand/Items...",
                      contentPadding: const EdgeInsets.only(left: 24.0),
                      border: InputBorder.none,
                    ),
                      onChanged: (String text) {
                        if (_debounce?.isActive ?? false) _debounce.cancel( );
                          _debounce =  Timer( const Duration( milliseconds: 1000 ), () {
  //                              _search();
                          } );
                        },
                    controller: _controller,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          isSearching?
          IconButton(
            icon: Icon(
              Icons.cancel,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _controller.clear();
                this.isSearching = false;
              });
            },
          ):
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {

                this.isSearching = true;
              });
            },
          )

        ],


        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: <Widget>[
            new Tab(child: Container(child: Text('HOME',style: TextStyle(fontSize: 13,letterSpacing: 1),maxLines: 1),),),
            new Tab(child: Container(child: Text('EVENTS',style: TextStyle(fontSize: 13,letterSpacing: 1),maxLines: 1,),),),
            new Tab(child: Container(child: Text('SCAN',style: TextStyle(fontSize: 13,letterSpacing: 1),maxLines: 1,),),),
            new Tab(icon: Icon(Icons.settings),),
          ],
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.black87.withOpacity(0.8), BlendMode.difference),
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: TabBarView(
            dragStartBehavior: DragStartBehavior.start,
            controller: _tabController,
            children: <Widget>[
              new SearchPage(),
              new EventsPage(),
              new ScanerProducts(),
              new SettingsPage(),
            ],
          ),
        ),
      ),
    );
  }
}


