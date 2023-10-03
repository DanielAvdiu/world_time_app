import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async{

    Uri uri=Uri.parse("http://worldtimeapi.org/api/timezone/Europe/London");
    Response response = await get(uri);
    Map data = jsonDecode(response.body);
    //print(data);

    //get properties from data
    String datetime=data['datetime'];
    int offset=data['dst_offset'];
    print(datetime);
    print(offset);

  }

  @override
  void initState() {
    super.initState();
    getTime();
  }


  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Text("Loading Screen"),
    );
  }
}
