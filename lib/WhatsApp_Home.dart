import 'package:flutter/material.dart';
import 'package:flutterchat/pages/camera.dart';
import 'package:flutterchat/pages/chats.dart';
import 'package:flutterchat/pages/state.dart';
import 'package:flutterchat/pages/calls.dart';

class WhatsAppHome extends StatefulWidget {
  var cameras;
  WhatsAppHome(this.cameras);
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController controller;
  String chats = 'CHATS';
  String estados = 'ESTADOS';
  String llamadas = 'LLAMADAS';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 4, vsync: this,initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('FlutterChat'),
        bottom: new TabBar(
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.camera_alt),
            ),
            new Tab(
              text: chats,
            ),
            new Tab(
              text: estados,
            ),
            new Tab(
              text: llamadas,
            ),
          ],
          controller: controller,
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          new Icon(Icons.more_vert)
        ],
      ),
      body: new TabBarView(
            children: <Widget>[
              new CameraScreen(widget.cameras),new ChatScreen(),new StatusScreen(), new CallsScreen()
            ],
            controller: controller,
          ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () => print("open chats"),
      ),
    );
  }
}


