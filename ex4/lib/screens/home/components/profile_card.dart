import 'package:ex4/models/user_profile.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final UserProfile userProfile;
  final Function press;

  const ProfileCard({Key key, this.userProfile, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Hero(
                tag: '${userProfile.email}',
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22,
                  child: ClipOval(
                      child: Image.network(userProfile.picture.thumbnail)),
                ),
              ),
            ),
            Text(
              userProfile.name.first,
            ),
          ],
        ),
      ),
    );
  }
}
