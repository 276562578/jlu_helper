import 'package:flutter/material.dart';
import 'package:jlu_helper/responsive.dart';

class Uims extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              if (Responsive.isMobile(context))
                Row(
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back))
                  ],
                ),
              Text("UIMS page")
            ],
          )
        ],
      ),
    );
  }

}