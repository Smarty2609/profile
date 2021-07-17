import 'package:flutter/material.dart';
import 'profilepic.dart';
import 'package:http/http.dart' as http;
import 'onlinedata.dart';
import 'dart:convert';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<UserData> _userdata = List<UserData>.empty(growable: false);
  Future<List<UserData>> fetchData() async {
    // List<UserData> _list = [];
    //var userdata = _list;
    var response = await http.post(
        Uri.parse("http://app.aoipl.com/api/member/?id=401&Dbname=aastha"));
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
      appBar: AppBar(
        title: Text(
          "Personal Information",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.amber[200],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: _userdata.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      ProfilePic(),
                      SizedBox(
                        height: 30,
                      ),
                      MenuList(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.indigo,
                        ),
                        text: _userdata[index].memberID,
                      ),
                      MenuList(
                        icon: Icon(
                          Icons.person,
                          color: Colors.indigo,
                        ),
                        text: _userdata[index].memberName,
                      ),
                      MenuList(
                          icon: Icon(
                            Icons.person_add_alt,
                            color: Colors.indigo,
                          ),
                          text: _userdata[index].fatherName),
                      MenuList(
                          icon: Icon(
                            Icons.phone,
                            color: Colors.indigo,
                          ),
                          text: _userdata[index].mobile),
                      MenuList(
                          icon: Icon(
                            Icons.credit_card_sharp,
                            color: Colors.indigo,
                          ),
                          text: _userdata[index].adharCardNo),
                      MenuList(
                        icon: Icon(
                          Icons.credit_card,
                          color: Colors.indigo,
                        ),
                        text: null ? 'Pan No' : _userdata[index].panno,
                      ),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: MenuList(
                            icon: Icon(
                              Icons.location_city,
                              color: Colors.indigo,
                            ),
                            text: _userdata[index].address),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: OutlinedButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Colors.grey[100],
              // shadowColor: Colors.red,
              padding: EdgeInsets.all(20)),
          onPressed: () {},
          child: Row(
            children: <Widget>[
              icon,
              SizedBox(
                width: 25,
              ),
              Text(
                text,
                style: TextStyle(color: Colors.black),
              )
            ],
          )),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'profilepic.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Personal Information",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.amber[200],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              ProfilePic(),
              SizedBox(
                height: 30,
              ),
              MenuList(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.indigo,
                  ),
                  text: 'Account Holder Id'),
              MenuList(
                  icon: Icon(
                    Icons.person,
                    color: Colors.indigo,
                  ),
                  text: 'Account Holder Name'),
              MenuList(
                  icon: Icon(
                    Icons.person_add_alt,
                    color: Colors.indigo,
                  ),
                  text: 'Fathers Name'),
              MenuList(
                  icon: Icon(
                    Icons.calendar_view_day,
                    color: Colors.indigo,
                  ),
                  text: 'Dob'),
              MenuList(
                  icon: Icon(
                    Icons.location_city,
                    color: Colors.indigo,
                  ),
                  text: 'Address'),
              MenuList(
                  icon: Icon(
                    Icons.phone,
                    color: Colors.indigo,
                  ),
                  text: 'Mobile No'),
              MenuList(
                  icon: Icon(
                    Icons.credit_card_sharp,
                    color: Colors.indigo,
                  ),
                  text: 'Adhaar No'),
              MenuList(
                  icon: Icon(
                    Icons.credit_card,
                    color: Colors.indigo,
                  ),
                  text: 'Pan No'),
            ],
          ),
        ));
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: OutlinedButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Colors.grey[100],
              // shadowColor: Colors.red,
              padding: EdgeInsets.all(20)),
          onPressed: () {},
          child: Row(
            children: <Widget>[
              icon,
              SizedBox(
                width: 25,
              ),
              Text(
                text,
                style: TextStyle(color: Colors.black),
              )
            ],
          )),
    );
  }
}
*/

