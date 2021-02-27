import 'package:ex4/models/user_profile.dart';
import 'package:ex4/screens/details/components/profile.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final UserProfile userProfile;

  const DetailsScreen({Key key, this.userProfile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Profile(
            userProfile: userProfile,
          ),
        ),
      ),
    );
  }
}
