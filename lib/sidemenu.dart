import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  bool isLogin = false;
  String name = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              color: Colors.lightBlueAccent,
              padding: EdgeInsets.all(8),
              child: Row(
                children: isLogin
                    ? [Icon(Icons.account_circle), Expanded(child: Text(name)),IconButton(onPressed: (){}, icon: Icon(Icons.exit_to_app))]
                    : [Container(child: Row(children:[Icon(Icons.account_circle_outlined), Expanded(child: Text("未登录"))]),)],
              ),
            )
          ],
        ));
  }
}
