import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jlu_helper/modules/communication.dart';
import 'package:jlu_helper/modules/gim.dart';
import 'package:jlu_helper/modules/oa_new.dart';
import 'package:jlu_helper/modules/uims.dart';
import 'package:jlu_helper/responsive.dart';
import 'package:jlu_helper/sidemenu.dart';
import 'package:jlu_helper/subpage.dart';

class MainBody extends StatelessWidget {
  final GlobalKey<ScaffoldState> _mainBodyKey = GlobalKey<ScaffoldState>();
  final GlobalKey<SubPageState> sub_page_key;
  MainBody({Key? key, required this.sub_page_key});


  @override
  Widget build(BuildContext context) {
    Widget _mainCard(String txt, router) {
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
              if(Responsive.isMobile(context)){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => router),
                )
              }else{
                sub_page_key.currentState!.changeBody(router)
              }
            },
          ),
          margin: EdgeInsets.all(1 / 8 * constraints.maxWidth),
          color: Colors.white38,
        );
      });
    }

    // TODO: implement build
    return Scaffold(
      key: _mainBodyKey,
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: SideMenu(),
      ),
      body: Column(
        children: [
          Row(
            children: [
              if (!Responsive.isDesktop(context))
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    _mainBodyKey.currentState!.openDrawer();
                  },
                ),
            ],
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              children: [
                _mainCard("校内\n通知", OANews()),
                _mainCard("沟通\n交流", Communication()),
                _mainCard("教务系统\nUIMS", Uims()),
                _mainCard("研究生系统\nGIM", Gim()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
