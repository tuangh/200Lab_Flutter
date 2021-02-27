import 'package:ex4/models/user_profile.dart';
import 'package:ex4/services/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ex4/my_theme_provider.dart';
import 'package:flutter/foundation.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<UserProfile>> userProfiles;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userProfiles = fetchUserProfiles();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<MyThemeModel>(
            builder: (context, theme, child) => Switch(
              value: theme.isLightTheme,
              onChanged: (value) {
                context.read<MyThemeModel>().changeTheme();
              },
            ),
          )
        ],
      ),
      body: Container(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Body(userProfiles: snapshot.data);
            } else if (snapshot.hasError) {
              return Text('Snapshot has error');
            }

            return CircularProgressIndicator();
          },
          future: userProfiles,
        ),
      ),
    );
  }
}
