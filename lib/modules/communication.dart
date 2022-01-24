import 'package:flutter/material.dart';
import 'package:jlu_helper/responsive.dart';

class Communication extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                Text("Communication page")
              ],
            )
          ],
        ),
      ),
    );
  }

}