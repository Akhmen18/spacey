import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spacey/constants.dart';
import 'package:spacey/spaceyDisplay.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String _data;
  String _name;
  String _image;
  String _date;
  String _info;

  void getSpaceData() async {
    Uri uri = Uri.parse('https://api.nasa.gov/planetary/apod?api_key=$kApiKey');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      _data = response.body;
      _name = jsonDecode(_data)['title'];
      _info = jsonDecode(_data)['explanation'];
      _image = jsonDecode(_data)['url'];
      _date = jsonDecode(_data)['date'];
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpaceyDisplay(_name, _date, _info, _image),
          ));
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    getSpaceData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1c1427),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Spacey',
              style: kAppNameTextStyle,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            SpinKitDoubleBounce(
              color: Color(0xFF7eca9c),
              size: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
