import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubPage extends StatefulWidget {


  SubPage({Key? key,required this.body}):super(key: key);
  var body;
  @override
  State<SubPage> createState() => SubPageState(body: body);

}

class SubPageState extends State<SubPage>{
  var body;

  changeBody(Widget new_body){

    setState(() {
      body=new_body;
    });
  }


  SubPageState({Key? key,required this.body});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: body
    );
  }
}
