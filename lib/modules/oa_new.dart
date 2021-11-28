import 'package:flutter/material.dart';
import 'package:jlu_helper/responsive.dart';

class OANews extends StatelessWidget {
  final GlobalKey<ScaffoldState> oa_new_key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: oa_new_key,
      body: Column(
        children: [
          if (Responsive.isMobile(context))
            Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back))
              ],
            ),
          Text("OA page")
        ],
      ),
    );
  }
}
