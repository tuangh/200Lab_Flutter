import 'package:ex4/models/user_profile.dart';
import 'package:ex4/screens/details/details_screen.dart';
import 'package:ex4/screens/home/components/profile_card.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final List<UserProfile> userProfiles;

  const Body({Key key, this.userProfiles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: userProfiles.length,
        itemBuilder: (context, index) => ProfileCard(
          userProfile: userProfiles[index],
          press: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    DetailsScreen(userProfile: userProfiles[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
