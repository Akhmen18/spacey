import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacey/constants.dart';

class SpaceyDisplay extends StatefulWidget {
  final String name;
  final String date;
  final String info;
  final String image;

  SpaceyDisplay(this.name, this.date, this.info, this.image);

  @override
  _SpaceyDisplayState createState() => _SpaceyDisplayState();
}

class _SpaceyDisplayState extends State<SpaceyDisplay> {
  String _name;
  String _date;
  String _info;
  String _image;
  bool _isDark = true;

  double cardOpacity = 0.6;
  double textOpacity = 1.0;
  double elavationVal = 1.0;

  @override
  void initState() {
    _name = widget.name;
    _date = widget.date;
    _info = widget.info;
    _image = widget.image;
    super.initState();
  }

  void setOpacity() {
    setState(() {
      if (this.textOpacity == 1.0) {
        this.cardOpacity = 0.0;
        this.textOpacity = 0.0;
        this.elavationVal = 0.0;
      } else {
        this.cardOpacity = 0.6;
        this.textOpacity = 1.0;
        this.elavationVal = 1.0;
      }
    });
  }

  void switchTheme() {
    setState(() {
      if (this._isDark) {
        this._isDark = false;
      } else {
        this._isDark = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    void showBottomSheet() => showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(
                color: (_isDark) ? kBackgroundDark : kBackgroundLight,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Made and Designed by Akhil',
                      style: kDateTextStyle.copyWith(
                          color: (this._isDark)
                              ? kMainColorDark
                              : kMainColorLight),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '~ A Technology Enthusiast',
                      style: kInfoTextStyle.copyWith(
                        color:
                            (this._isDark) ? kColorNasaDark : kColorNasaLight,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "This is an app that demonstrates the power of using API's. The App uses NASA's APOD API that fetches the image for the day and its information which is then displayed to the final user. ",
                      style: kDateTextStyle.copyWith(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w200,
                        color:
                            (this._isDark) ? kInfoColorDark : kInfoColorLight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });

    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actionsIconTheme: IconThemeData(
              size: 30.0,
              color: (this._isDark) ? kMainColorDark : kMainColorLight,
              opacity: 10.0),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            '$_name',
            textAlign: TextAlign.center,
            style: kNameTextStyle.copyWith(
              color: (this._isDark) ? kMainColorDark : kMainColorLight,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: switchTheme,
                child: Icon(Icons.wb_sunny_rounded),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: showBottomSheet,
                child: Icon(Icons.account_circle_rounded),
              ),
            ),
          ],
        ),
        backgroundColor: (this._isDark) ? kBackgroundDark : kBackgroundLight,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   child: Padding(
              //     padding: const EdgeInsets.fromLTRB(0.0, 10, 0.0, 5.0),
              //     child: Card(
              //       elevation: elavationVal,
              //       color: Color(0xff242424).withOpacity(cardOpacity),
              //       child: Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Text(
              //           '$_name',
              //           textAlign: TextAlign.center,
              //           style: kNameTextStyle.copyWith(
              //               color: Color(0xFFccffbd).withOpacity(textOpacity)),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                //height: MediaQuery.of(context).size.height / 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 2.5),
                  child: Card(
                    color: (this._isDark) ? kMainColorDark : kCardColorLight,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image(
                        image: NetworkImage(_image),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.8,
                color: (this._isDark) ? kBackgroundDark : kBackgroundLight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 2.5, 10.0, 0.0),
                  child: Card(
                    color: (this._isDark) ? kCardColorDark : kCardColorLight,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView(
                        children: [
                          Text(
                            '$_date',
                            style: kDateTextStyle.copyWith(
                                color: (this._isDark)
                                    ? kMainColorDark
                                    : kMainColorLight),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Information by NASA',
                            style: kInfoTextStyle.copyWith(
                              color: (this._isDark)
                                  ? kColorNasaDark
                                  : kColorNasaLight,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '$_info',
                            style: kInfoTextStyle.copyWith(
                                color: (this._isDark)
                                    ? kInfoColorDark
                                    : kInfoColorLight),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
