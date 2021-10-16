import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MainBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Widget _mainCard(String txt) {
      return LayoutBuilder(
        builder:(BuildContext context,BoxConstraints constraints){
          return Card(
            child: ListTile(
              title: Center(
                  child: AutoSizeText(
                    txt,
                    textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 1/8*constraints.maxWidth),
                  )),
              onTap: () => print("tap"),
            ),
            margin: EdgeInsets.all(1/10*constraints.maxWidth),
            color: Colors.white38,
          );
        }
          );
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
          _mainCard("校内\n通知"),
          _mainCard("沟通\n交流"),
          _mainCard("教务系统\nUIMS"),
          _mainCard("研究生系统\nGIM"),
        ],
      ),
    );
  }

}