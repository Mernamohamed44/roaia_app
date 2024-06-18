import 'package:flutter/material.dart';
import 'package:roaia_app/localization/localization_methods.dart';
import 'package:roaia_app/models/contact.dart';
import 'package:roaia_app/screen/add_contact.dart';

class User_Screen extends StatefulWidget {
  const User_Screen({super.key});

  @override
  State<User_Screen> createState() => _User_ScreenState();
}

class _User_ScreenState extends State<User_Screen> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();

    //user provider
    // final user = Provider.of<UserProvider>(context, listen: false);
    //
    // Api.getContacts(token: user.user.token).then((value) {
    //   if (value.success) {
    //     setState(() {
    //       contacts.clear();
    //       contacts.addAll(value.data!);
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .30,
                  ),
                  Container(
                    width: 113,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffE5E5E5),
                          spreadRadius: 15,
                          blurRadius: 10,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        tr("users", context),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff5095FF)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Add_Contact_Screen(),
                          ));
                    },
                    child: Image.asset('assets/images/image6.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: contacts.length * 100,
                child: ListView.builder(
                  itemCount: contacts.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    final contact = contacts[index];
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: const Color(0xff2323230A))),
                      child: ListTile(
                        leading: Image.network(contact.imageUrl),
                        title: Text(
                          "${contact.fullName}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              contact.relation,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '${contact.age}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        trailing: const Icon(Icons.edit_rounded),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
