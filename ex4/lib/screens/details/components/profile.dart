import 'package:ex4/models/user_profile.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final UserProfile userProfile;

  const Profile({Key key, this.userProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Hero(
            tag: '${userProfile.email}',
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 67,
              child: ClipOval(child: Image.network(userProfile.picture.large)),
            ),
          ),
          Text('${userProfile.name.first} ${userProfile.name.last}'),
          Text(userProfile.email),
          Text(userProfile.phone),
          Text('${userProfile.location.city} ${userProfile.location.country}')
        ],
      ),
    );
  }
}
