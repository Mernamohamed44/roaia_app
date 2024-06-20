import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roaia_app/localization/localization_methods.dart';
import 'package:roaia_app/screen/change_password/change_password.dart';
import 'package:roaia_app/screen/edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  bool read = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 110.w,
                    ),
                    Container(
                      width: 120.w,
                      height: 55.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffE5E5E5),
                            spreadRadius: 12,
                            blurRadius: 12,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          tr("profile_info", context),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff5095FF)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Edit_Profile(),
                              ));
                        },
                        child: Image.asset('assets/images/edit.png'))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/images/image5.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Shahd tarek',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 44,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Color(0xffF1F3F9),
                      borderRadius: BorderRadius.circular(12)),
                  child: Text.rich(
                    TextSpan(
                        text: tr("user_name", context),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: '   \n    shahd_123',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff57534E)),
                          )
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Color(0xffF1F3F9),
                      borderRadius: BorderRadius.circular(12)),
                  child: Text.rich(
                    TextSpan(
                        text: tr("phone_number", context),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: '   \n    01102507463',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff57534E)),
                          )
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Color(0xffF1F3F9),
                      borderRadius: BorderRadius.circular(12)),
                  child: Text.rich(
                    TextSpan(
                        text: tr("Email", context),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: '   \n    shahd.tarek123@gmail.com',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff57534E)),
                          )
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Color(0xffF1F3F9),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                            text: tr("Password", context),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                text: '   \n    ********',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff57534E)),
                              )
                            ]),
                      ),
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * .25,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Color(0xff9DC3FFF0),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            )),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChangePasswordScreen(),
                                ));
                          },
                          child: Text(
                            tr("change", context),
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Color(0xff1363DF)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
