import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roaia_app/localization/localization_methods.dart';
import 'package:roaia_app/screen/home.dart';
import 'package:roaia_app/screen/notification.dart';
import 'package:roaia_app/screen/user.dart';
import 'package:roaia_app/screen/user_profile/profile.dart';
import 'package:roaia_app/screen/user_profile/user_info_cubit.dart';

class Botton_Bar extends StatefulWidget {
  const Botton_Bar({super.key});

  @override
  State<Botton_Bar> createState() => _Botton_BarState();
}

class _Botton_BarState extends State<Botton_Bar> {
  int currentIndex = 0;

  List Screen = [
    Home_Screen(),
    User_Screen(),
    Notification_Screen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserInfoCubit(),
        child: Builder(
          builder: (context) {
           var cubit=BlocProvider.of<UserInfoCubit>(context);
           cubit.userInfoData();
            return Scaffold(
              body: Screen[currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.route_outlined),
                    label: tr("location", context),
                  ),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.person_outline),
                      label: tr("users", context)),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.notification_important_outlined),
                      label: tr("notification", context)),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.account_circle_outlined),
                    label: tr("profile", context),
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            );
          },
        )
    );
  }
}
