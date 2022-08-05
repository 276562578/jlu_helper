import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  bool isLogin = false;
  bool isPublic = false;
  bool isWebVPN = false;
  String name = "";
  String nullName = "未登录";
  String isPublicFalse = "当前不可被发现";
  String isPublicTrue = "当前可作为主机";
  String isWebVPNTrue="（WebVPN已上线）";
  String isWebVPNFalse="（WebVPN未上线，请登录）";

  Widget headContainer(BuildContext context) {
    Widget head = Container();
    if (isLogin) {
      head = Column(
        children: [
          Row(
            children: [
              const Icon(Icons.account_circle),
              Expanded(child: Text(name)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.exit_to_app)),
            ],
          ),
          Row(
            children: [
              Text(
                isPublicTrue,
                textScaleFactor: 0.7,
              ),
              Icon(
                Icons.circle,
                color: Colors.red,
                size: 8,
              ),
            ],
          ),
        ],
      );
    } else {
      head = Column(
        children: [
          InkWell(
            child: Row(
              children: [
                Icon(Icons.account_circle_outlined),
                Expanded(
                    child: Text(
                  nullName,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                )),
              ],
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Text("登录界面"),
                    );
                  });
            },
          ),
          Row(
            children: [
              Text(
                isPublicFalse,
                textScaleFactor: 0.7,
              ),
              Icon(
                Icons.circle,
                color: Colors.red,
                size: 8,
              ),
              if (isWebVPN)
                Text(
                  isWebVPNTrue,
                  textScaleFactor: 0.7,
                )
              else
                Text(
                  isWebVPNFalse,
                  textScaleFactor: 0.7,
                ),
            ],
          )
        ],
      );
    }
    return Container(
      color: Colors.lightBlueAccent,
      padding: EdgeInsets.all(8),
      child: head,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            headContainer(context),
            Container(),
          ],
        ));
  }
}
