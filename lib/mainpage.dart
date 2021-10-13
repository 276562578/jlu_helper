import 'package:flutter/material.dart';
import 'package:jlu_helper/mainbody.dart';
import 'package:jlu_helper/responsive.dart';
import 'package:jlu_helper/sidemenu.dart';
import 'package:jlu_helper/subpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

        body: Responsive(
          mobile: Row(children: [

            Expanded(
              child: MainBody(),
              flex: _size.width > 1340 ? 3:5,
            ),

          ]),
          tablet: Row(children: [
           Expanded(
              child: MainBody(),
              flex: 6,
            ),
            Expanded(
              child: SubPage(),
              flex: 9,
            ),
          ]),
          desktop: Row(children: [
            Expanded(
              child: SideMenu(),
              flex: _size.width > 1340 ? 2:4,
            ),
            Expanded(
              child: MainBody(),
              flex: _size.width > 1340 ? 3:5,
            ),
            Expanded(
              child: SubPage(),
              flex: _size.width > 1340 ? 8:10,
            ),
          ]),
        )

        // floatingActionButton: FloatingActionButton(
        //   onPressed: null,
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.add),
        // ), // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
