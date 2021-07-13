import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 110,
        width: 115,
        child: Stack(
            fit: StackFit.expand,
            overflow: Overflow.visible,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZSUyMHBpY3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"),
              ),
              Positioned(
                  right: -12,
                  bottom: 0,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Colors.grey[300],
                      shadowColor: Colors.black38,
                    ),
                    onPressed: () {},
                    child: Icon(
                      Icons.camera,
                      color: Colors.black54,
                    ),
                  ))
            ]));
  }
}
