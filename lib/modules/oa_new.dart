import 'package:flutter/material.dart';
import 'package:jlu_helper/constants.dart';
import 'package:jlu_helper/responsive.dart';
import 'package:http/http.dart';
import 'package:html/parser.dart' show parse;
import 'package:jlu_helper/global.dart';

class OANews extends StatelessWidget {
  final GlobalKey<ScaffoldState> oa_new_key = GlobalKey<ScaffoldState>();

  Future<List<ListTile>> getOANews() async {
    String request_url = oa_news_url;
    if (Global.isWebVPN) request_url = oa_news_vpn_url;
    final response = await get(Uri.parse(request_url));
    var document = parse(response.body);
    return document.getElementsByClassName("li rel").map((element) {
      String title = element.getElementsByClassName("font14")[0].text;
      String author = element.getElementsByClassName("column")[0].innerHtml;
      String time = element.getElementsByClassName("time")[0].innerHtml.replaceAll('&nbsp;', '');
      ;
      return ListTile(
        title: Text(title),
        subtitle: Text(author),
        trailing: Text(time),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: oa_new_key,
      body: SafeArea(
        child: Column(children: [
          if (Responsive.isMobile(context))
            Row(
              children: [
                IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back)),
                Text("OA新闻")
              ],
            ),
          Expanded(
            child: FutureBuilder<List<ListTile>>(
                future: getOANews(),
                // initialData: [],
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
                  if (snapshot.error != null) return Center(child: Text("请求失败"));
                  final data = snapshot.data;
                  return ListView(
                    children: data!,
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
