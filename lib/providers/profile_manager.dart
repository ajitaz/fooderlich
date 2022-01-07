import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/models.dart';

class ProfileManager extends ChangeNotifier {
  User get getUser => User(
        firstName: 'Stef',
        lastName: 'Patt',
        role: 'Flutterista',
        profileImageUrl: 'assets/profile_pics/person_stef.jpeg',
        points: 100,
        darkMode: _darkMode,
      );
  bool get didSelectUser => _didSelectUser;
  bool get didTapOnRaywenderLich => _tapOnRaywenderLich;
  bool get darkMode => _darkMode;

  var _didSelectUser = false;
  var _tapOnRaywenderLich = false;
  var _darkMode = false;

  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  void tapOnRaywenderLich(bool selected) {
    _tapOnRaywenderLich = selected;
    notifyListeners();
  }

  void tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
}

final profileManager =
    ChangeNotifierProvider<ProfileManager>((ref) => ProfileManager());
