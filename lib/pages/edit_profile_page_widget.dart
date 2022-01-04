import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:leja/pages/edit_profile_pic.dart';
import 'package:leja/pages/profile_page.dart';

class EditProfile extends StatefulWidget {
  static String desk = 'desk';
  const EditProfile({
    Key? key,
  }) : super(key: key);

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  final controller = TextEditingController();
  final _emailcontroller = TextEditingController();

  static String name = "";
  static String email = "";

  var named = '';
  var age = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference loggedUser =
        FirebaseFirestore.instance.collection('UserData');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Column(
                children: [
                  FutureBuilder<DocumentSnapshot>(
                    future: loggedUser
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text("Something went wrong");
                      }

                      if (snapshot.hasData && !snapshot.data!.exists) {
                        return const Text("Data requested does not exist");
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ClipOval(
                                child: Material(
                                    child: CachedNetworkImage(
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                  imageUrl: "${data['pic_link']}",
                                )),
                              )
                            ],
                          ),
                        );
                      }

                      return const Text("loading");
                    },
                  ),
                  IconButton(
                    tooltip: 'Add Profile Photo',
                    icon: const Icon(
                      Icons.add_a_photo,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePic(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Full Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(name),
                  TextField(
                    controller: controller,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(email),
                  TextField(
                    controller: _emailcontroller,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: ButtonTheme(
                  minWidth: 200.0,
                  height: 20.0,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        name = controller.text;
                        email = _emailcontroller.text;
                      });
                      if (name.isNotEmpty && email.isNotEmpty) {
                        FirebaseFirestore.instance
                            .collection('UserData')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .update({
                          "name": name,
                          "email": email,
                        });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                        );
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Update Profile'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
