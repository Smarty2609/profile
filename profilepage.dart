import 'package:flutter/material.dart';
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
