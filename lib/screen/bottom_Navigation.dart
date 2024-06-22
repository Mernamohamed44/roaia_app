import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roaia_app/core/helpers/cache_helper.dart';
import 'package:roaia_app/localization/localization_methods.dart';
import 'package:roaia_app/screen/all_Contacts/all_Contacts.dart';
import 'package:roaia_app/screen/home.dart';
import 'package:roaia_app/screen/notification.dart';
import 'package:roaia_app/screen/user_profile/profile.dart';
import 'package:roaia_app/screen/user_profile/user_info_cubit.dart';

import 'refresh_token/refresh_token/view.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({super.key});

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int currentIndex = 0;

  List Screen = [
    Home_Screen(),
    ContactsScreen(),
    Notification_Screen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserInfoCubit(),
        child: Builder(
          builder: (context) {
            var cubit = BlocProvider.of<UserInfoCubit>(context);
            cubit.userInfoData();
            return BlocConsumer<UserInfoCubit, UserInfoStates>(
              listener: (context,state){
                if (state is UnAuthorizedState) {
                  print(' token ref ${  CacheHelper.get(key: 'refreshToken')
                  }');
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return RefreshTokenView();
                  }));
                }
              },
              builder: (context,state) {
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
            );
          }
        ));
  }
}
