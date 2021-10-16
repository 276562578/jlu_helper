import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jlu_helper/modules/communication.dart';
import 'package:jlu_helper/modules/gim.dart';
import 'package:jlu_helper/modules/oa_new.dart';
import 'package:jlu_helper/modules/uims.dart';

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _mainCard(String txt,router) {
      return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Card(
          child: ListTile(
            title: Center(
                child: Text(
              txt,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 1 / 10 * constraints.maxWidth),
            )),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => router),)
            },
          ),
          margin: EdgeInsets.all(1 / 8 * constraints.maxWidth),
          color: Colors.white38,
        );
      });
    }

    // TODO: implement build
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        children: [
          _mainCard("校内\n通知",OANews()),
          _mainCard("沟通\n交流",Communication()),
          _mainCard("教务系统\nUIMS",Uims()),
          _mainCard("研究生系统\nGIM",Gim()),
        ],
      ),
    );
  }
}
