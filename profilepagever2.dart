import 'package:flutter/material.dart';
import 'profilepic.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'onlinedata.dart';
import 'dart:ui';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<UserData> _userdata = List<UserData>.empty(growable: (true));
  Future<List<UserData>> fetchData() async {
    // List<UserData> _list = [];
    //var userdata = _list;
    var response = await http.post(
        Uri.parse("http://app.aoipl.com/api/member/?id=357&Dbname=aastha"));
    if (response.statusCode == 200) {
      print(response.body);
      var jsondata = jsonDecode(response.body);
      print('fsdfds');
      _userdata.add(UserData.fromJson(jsondata));
    }
    print(_userdata);
    return _userdata;
  }

  @override
  void initState() {
    setState(() {
      fetchData().then((value) => _userdata.addAll(value));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: _userdata.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.215,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(90),
                      ),
                      gradient: LinearGradient(
                          colors: <Color>[Color(0xFFFC1D0B), Color(0xFFFCA40B)],
                          tileMode: TileMode.repeated),
                    ),
                    // color: Colors.amber.shade200,
                    child: Stack(children: <Widget>[
                      Positioned(
                        top: 50,
                        left: 0,
                        child: Container(
                            height: 70,
                            width: 300,
                            // color: Colors.black,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  topRight: Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  offset: new Offset(5.0, 8.0),
                                  blurRadius: 20.0,
                                  spreadRadius: 1.0,
                                ),
                              ],
                            )),
                      ),
                      Positioned(
                        top: 68,
                        left: 20,
                        child: Text(
                          "Personal Information",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.deepPurple.shade900),
                        ),
                      )
                    ]),
                  ),
                  //SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.345,
                    //color: Color(0xFFFC1D0B),
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 30,
                          left: 15,
                          child: Material(
                            // animationDuration:,
                            child: Container(
                              height: 220,
                              width: MediaQuery.of(context).size.width * 0.92,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.5),
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    offset: new Offset(-10.0, 10.0),
                                    blurRadius: 28.0,
                                    spreadRadius: 4.0,
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Positioned(
                        top: 80,
                        left: 30,
                        child: Card(
                          elevation: 1.0,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 110,
                            width: 110,
                            child: ProfilePic(),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 55,
                        left: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Member Id',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.deepPurple.shade800,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            MenuList(
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.indigo,
                                  size: 15,
                                ),
                                text: _userdata[index].memberID),
                            Divider(color: Colors.indigo),
                            Text(
                              'Member Name',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.deepPurple.shade800,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            MenuList(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.indigo,
                                  size: 15,
                                ),
                                text: _userdata[index].memberName),
                            Divider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                            Text(
                              'Father\'s Name',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.deepPurple.shade800,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            MenuList(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.indigo,
                                  size: 15,
                                ),
                                text: _userdata[index].fatherName)
                          ],
                        ),
                      )
                    ]),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ListView(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 10, top: 25),
                            height: 120,
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 20,
                              bottom: 20,
                            ),
                            child: Box1(
                              text1: "Mobile No",
                              text2: _userdata[index].mobile,
                            )),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.001),
                        Container(
                          margin: EdgeInsets.only(bottom: 10, top: 25),
                          height: 180,
                          padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 20),
                          child: Box2(
                              text1: "Address",
                              text2: _userdata[index].address),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 10, top: 25),
                            height: 120,
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 20,
                              bottom: 20,
                            ),
                            child: Box1(
                              text1: "Adhaar Card No",
                              text2: _userdata[index].adharCardNo,
                            )),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.001),
                        Container(
                          margin: EdgeInsets.only(bottom: 10, top: 25),
                          height: 130,
                          padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 20),
                          child: Box2(
                              text1: "Pan No", text2: _userdata[index].panno),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}

class MenuList extends StatelessWidget {
  const MenuList({
    Key? key,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  final text;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            icon,
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              softWrap: true,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ));
  }
}

class Box1 extends StatelessWidget {
  const Box1({Key? key, @required this.text1, @required this.text2})
      : super(key: key);
  final text1;
  final text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        gradient: RadialGradient(colors: <Color>[
          Color(0xFFFBDC8A),
          Color(0xFFFFF4B9),
        ], tileMode: TileMode.repeated),
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(80.0)),
        boxShadow: [
          new BoxShadow(
            color: Colors.blueGrey.withOpacity(0.8),
            offset: new Offset(5.0, 0.0),
            blurRadius: 20.0,
            spreadRadius: 4.0,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              text1,
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.black,
              thickness: 1.3,
            ),
            Text(text2,
                softWrap: true,
                style: TextStyle(
                  fontSize: 26,
                )
                // overflow: TextOverflow.fade,
                ),
          ],
        ),
      ),
    );
  }
}

class Box2 extends StatelessWidget {
  const Box2({Key? key, @required this.text1, @required this.text2})
      : super(key: key);
  final text1;
  final text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(colors: <Color>[
          Color(0xFFFBDC8A),
          Color(0xFFFFF4B9),
        ], tileMode: TileMode.repeated),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0)),
        boxShadow: [
          new BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: new Offset(-5.0, 0.0),
            blurRadius: 20.0,
            spreadRadius: 4.0,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              text1,
              style: TextStyle(
                  fontSize: 19,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.black,
              thickness: 1.3,
            ),
            Text(text2,
                style: TextStyle(
                  fontSize: 23,
                ))
          ],
        ),
      ),
    );
  }
}
