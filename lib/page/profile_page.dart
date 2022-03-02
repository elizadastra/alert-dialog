// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_const

import 'package:alert_dialog/model/user.dart';
import 'package:alert_dialog/utilts/user_preferences.dart';
import 'package:alert_dialog/widgets/appbar_widget.dart';
import 'package:alert_dialog/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;
    final String imagePath;

    // const ProfileWidget({
    //   Key? key,
    //   required this.imagePath,
    // })
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
          ),
          const SizedBox(
            height: 24,
          ),
          buildName(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Text(
                user.position,
                style: const TextStyle(
                  color: Color(0xFF3B81EA),
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 39),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(height: 30),
              Align(
                child: Text(
                  "Направление",
                  style: TextStyle(
                    color: Color(0xFFA8A8A8),
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 0),
              Text(
                user.direction,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          const Divider(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(height: 30),
              Align(
                child: Text(
                  "Отдел",
                  style: TextStyle(
                    color: Color(0xFFA8A8A8),
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 0),
              Text(
                user.department,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          const Divider(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(height: 30),
              Align(
                child: Text(
                  "Email",
                  style: TextStyle(
                    color: Color(0xFFA8A8A8),
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 0),
              Text(
                user.email,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          const Divider(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(height: 30),
              Align(
                child: Text(
                  "Дата рождения",
                  style: TextStyle(
                    color: Color(0xFFA8A8A8),
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 0),
              Text(
                user.birthday,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          const Divider(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(height: 30),
              Align(
                child: Text(
                  "Телефон основной",
                  style: TextStyle(
                    color: Color(0xFFA8A8A8),
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(height: 0),
            TextButton(
              onPressed: () => showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                backgroundColor: Colors.white,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text('Позвонить'),
                                  ElevatedButton(
                                    child: const Text('x'),
                                    onPressed: () => Navigator.pop(context),
                                  )
                                ],
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  );
                },
              ),
              child: Text(
                user.phoneNumber,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ])
        ]),
      );
}
