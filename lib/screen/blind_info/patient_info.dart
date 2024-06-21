import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roaia_app/localization/localization_methods.dart';
import 'package:roaia_app/screen/blind_info/blind_info_cubit.dart';
import 'package:roaia_app/screen/botton_bar.dart';
import 'package:roaia_app/screen/edit_blind_info/edit_blind_info.dart';

class Patient_Info extends StatelessWidget {
  const Patient_Info({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlindInfoCubit(),
      child: _Patient_Info_Body(),
    );
  }
}

class _Patient_Info_Body extends StatelessWidget {
  const _Patient_Info_Body();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BlindInfoCubit>(context);
    cubit.blindInfoData();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          tr("patient_info", context),
          style: const TextStyle(
              color: Color(0xff1363DF),
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<BlindInfoCubit, BlindInfoStates>(
        builder: (context, state) {
          if (state is BlindInfoLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BlindInfoFailedState) return Text('${state.msg}');
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .10,
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            NetworkImage(cubit.BlindInfo!.imageUrl!),
                      ),
                    ),
                    Center(
                      child: Text(
                        '${cubit.BlindInfo!.fullName}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    Text(
                      'Full Name : ${cubit.BlindInfo!.fullName}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Age : ${cubit.BlindInfo!.age}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Gender : ${cubit.BlindInfo!.gender}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Diseases : ${cubit.BlindInfo!.diseases ?? ''}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Text(
                          tr("current_location", context),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NavigationBottom(),
                                ),
                                (route) => false);
                          },
                          child: Text(
                            tr("go_home", context),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.blueAccent),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: 360,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xff2C67FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditBlindInfo(
                              BlindName: cubit.BlindInfo!.fullName!,
                              BlindAge: "${cubit.BlindInfo!.age}",
                              BlindGender: cubit.BlindInfo!.gender,
                              Diseases: cubit.BlindInfo!.diseases!,
                            ),
                          ));
                        },
                        child: Text(
                          tr("edit", context),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
