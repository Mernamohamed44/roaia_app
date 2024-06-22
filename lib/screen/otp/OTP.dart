import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roaia_app/localization/localization_methods.dart';
import 'package:roaia_app/screen/login/login.dart';
import 'package:roaia_app/screen/otp/states.dart';
import 'package:roaia_app/screen/reset_password/Reset_Password.dart';

import 'cubit.dart';

class OTP_Screen extends StatelessWidget {
  const OTP_Screen({
    super.key,
    required this.email,
    this.navigateFromForget = false,
  });

  final String email;
  final bool navigateFromForget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpCubit(),
      child: _OTP_Body(
        email: email,
        navigateFromForget: navigateFromForget,
      ),
    );
  }
}

class _OTP_Body extends StatelessWidget {
  _OTP_Body({required this.email, required this.navigateFromForget});

  final String email;
  final bool navigateFromForget;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<OtpCubit>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          tr("otp", context),
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xff1363DF)),
        ),
        centerTitle: true,
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  tr("authentication_code", context),
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffABA9AB)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .14,
                    height: 53,
                    child: TextFormField(
                      controller: cubit.code1,
                      onSaved: (pin1) {},
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      style: const TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .14,
                    height: 53,
                    child: TextFormField(
                      controller: cubit.code2,
                      onSaved: (pin1) {},
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      style: const TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .14,
                    height: 53,
                    child: TextFormField(
                      controller: cubit.code3,
                      onSaved: (pin1) {},
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      style: const TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .14,
                    height: 53,
                    child: TextFormField(
                      controller: cubit.code4,
                      onSaved: (pin1) {},
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      style: const TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .14,
                    height: 53,
                    child: TextFormField(
                      controller: cubit.code5,
                      onSaved: (pin1) {},
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      style: const TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .14,
                    height: 53,
                    child: TextFormField(
                      controller: cubit.code6,
                      onSaved: (pin1) {},
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      style: const TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 37,
              ),
              BlocConsumer<OtpCubit, OtpStates>(
                listener: (context, state) {
                  if (state is OtpFailedState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.msg),
                      ),
                    );
                  } else if (state is NetworkErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Network Error"),
                      ),
                    );
                  } else if (state is OtpSuccessState) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => navigateFromForget
                            ? Reset_Password_Screen(
                                email: email,
                              )
                            : Login_Screen(),
                      ),
                      (route) => false,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is OtpLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: const Color(0xff2C67FF),
                      ),
                    );
                  }
                  return Container(
                    width: MediaQuery.of(context).size.width * 90,
                    height: 44,
                    decoration: BoxDecoration(
                      color: cubit.code6.text.isEmpty
                          ? Color(0xffE6F2FF)
                          : const Color(0xff2C67FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: cubit.code6.text.isEmpty
                          ? () {}
                          : () {
                              final String fullCode = cubit.code1.text +
                                  cubit.code2.text +
                                  cubit.code3.text +
                                  cubit.code4.text +
                                  cubit.code5.text +
                                  cubit.code6.text;

                              if (fullCode.length <= 6) {
                                cubit.otp(email: email, fullOtp: fullCode);
                              }
                            },
                      child: Text(
                        tr("verify", context),
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tr("code_send", context),
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xff040508)),
                  ),
                  Text(
                    '2:00',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color(0xff5095FF)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
