import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  late User currentUser;
  // final Stream<QuerySnapshot> users =
  //     FirebaseFirestore.instance.collection('users').snapshots();

  // var firestoreDB = FirebaseFirestore.instance.collection("board").snapshots();

  final controller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _aboutcontroller = TextEditingController();
  final _biocontroller = TextEditingController();
  final _skillscontroller = TextEditingController();
  final _hobbiescontroller = TextEditingController();
  final _coursecontroller = TextEditingController();
  // ignore: unused_field
  final _namedcontroller = TextEditingController();
  // ignore: unused_field
  final _agecontroller = TextEditingController();
  // ignore: non_constant_identifier_names
  final _registration_numbercontroller = TextEditingController();
  static String name = "";
  static String email = "";
  // ignore: unused_field
  static String about = "";
  static String bio = "";
  static String skills = "";
  static String hobbies = "";
  static String course = "";
  // ignore: non_constant_identifier_names
  static String registration_number = "";
  var named = '';
  var age = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // CollectionReference user = FirebaseFirestore.instance.collection('users');
    CollectionReference loggedUser =
        FirebaseFirestore.instance.collection('UserData');
    // ignore: unused_local_variable
    var _imagePath = loggedUser.doc(currentUser.email).get();

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
                    future: loggedUser.doc(currentUser.email).get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text("Something went wrong");
                      }

                      if (snapshot.hasData && !snapshot.data!.exists) {
                        return const Text("Document does not exist");
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

                  // ProfileWidget(
                  //   imagePath: _imagePath,
                  //   onClicked: () async {},
                  // ),
                  IconButton(
                    tooltip: 'Add Profile Photo',
                    icon: const Icon(
                      Icons.add_a_photo,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => EditProfilePic(
                      //       user: currentUser,
                      //     ),
                      //   ),
                      // );
                    },
                  ),
                  // StreamBuilder<QuerySnapshot>(
                  //   builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                  //     if (!snapshot.hasData) return CircularProgressIndicator();
                  //     return ListView.builder(
                  //         itemCount: snapshot.data!.docs.length,
                  //         itemBuilder: (context, int index) {
                  //           return Text(snapshot.data!.docs[index]['title']);
                  //         });
                  //   },
                  //   stream: firestoreDB,
                  // ),

                  // Center(
                  //   child: StreamBuilder(
                  //     stream: FirebaseFirestore.instance
                  //         .collection('groceries')
                  //         .orderBy('name')
                  //         .snapshots()
                  //     // FirebaseFirestore.instance
                  //     //     .collection('UserData')
                  //     //     .snapshots()
                  //     ,
                  //     builder:
                  //         (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  //       if (!snapshot.hasData) {
                  //         return Center(child:  const Text('Loading'));
                  //       }
                  //       return ListView(
                  //         children: snapshot.data!.docs.map((grocery) {
                  //           return Center(
                  //               child: ListTile(
                  //             title: Text(grocery['name']),
                  //             onLongPress: () {
                  //               grocery.reference.delete();
                  //                const Text('hey');
                  //             },
                  //           ));
                  //         }).toList(),
                  //       );
                  //     },
                  //   ),
                  // )
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Course',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(course),
                  TextField(
                    controller: _coursecontroller,
                    maxLines: 1,
                    decoration: InputDecoration(
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
                    'Registration Number',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(registration_number),
                  TextField(
                    controller: _registration_numbercontroller,
                    maxLines: 1,
                    decoration: InputDecoration(
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
                    'Bio',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(bio),
                  TextField(
                    controller: _biocontroller,
                    maxLines: 5,
                    decoration: InputDecoration(
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
                    'Skills',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(skills),
                  TextField(
                    controller: _skillscontroller,
                    maxLines: 5,
                    decoration: InputDecoration(
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
                    'Hobbies',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(hobbies),
                  TextField(
                    controller: _hobbiescontroller,
                    maxLines: 5,
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
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      // primary: Colors.white,
                      // backgroundColor: Colors.black,
                      shape: const StadiumBorder(),
                      elevation: 2,
                      padding: const EdgeInsets.all(7.5),
                    ),
                    onPressed: () {
                      setState(() {
                        name = controller.text;
                        email = _emailcontroller.text;
                        about = _aboutcontroller.text;
                        bio = _biocontroller.text;
                        skills = _skillscontroller.text;
                        course = _coursecontroller.text;
                        hobbies = _hobbiescontroller.text;
                        registration_number =
                            _registration_numbercontroller.text;
                      });
                      FirebaseFirestore.instance
                          .collection('UserData')
                          .doc(currentUser.email)
                          .update({
                        "bio": bio,
                        "name": name,
                        "email": email,
                        "about": about,
                        "skills": skills,
                        "course": course,
                        "hobbies": hobbies,
                        "registration_number": registration_number
                      });
                      // user.add({'name':named,'age':age}).then((value) => print('User Added')).catchError((error)=>print('Failed to add User: $error'));
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                        ModalRoute.withName('/'),
                      );
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
