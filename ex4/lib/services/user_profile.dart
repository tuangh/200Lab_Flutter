import 'package:ex4/models/user_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<UserProfile>> fetchUserProfiles() async {
  final response = await http.get('https://randomuser.me/api/?results=50');
  return compute(parseUserProfile, response.body);
}

List<UserProfile> parseUserProfile(String responseBody) {
  final jsonResponse = jsonDecode(responseBody);
  final userProfiles = List<UserProfile>.from(
      jsonResponse['results'].map((json) => UserProfile.fromJson(json)));

  return userProfiles;
}
