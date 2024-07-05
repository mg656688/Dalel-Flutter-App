import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/profile/presentation/views/edit_profile_page.dart';
import 'package:dalel/features/profile/presentation/views/privacy_policy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({Key? key}) : super(key: key);

  final User? _user = FirebaseAuth.instance.currentUser;
  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection('Users');

  Future<DocumentSnapshot> _getUserProfile() async {
    if (_user != null) {
      final snapshot = await _usersCollection.doc(_user!.uid).get();
      return snapshot;
    } else {
      throw Exception('User not authenticated');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My profile",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _getUserProfile(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return const Center(child: Text('No user data found'));
          }

          Map<String, dynamic> userData =
          snapshot.data!.data()! as Map<String, dynamic>;

          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 15),
                child: CircleAvatar(
                  radius: 62,
                  backgroundColor: AppColors.primaryColor,
                  child: CircleAvatar(
                    radius: 60,
                    foregroundImage: NetworkImage(userData["photo_url"] ?? ''),
                  ),
                ),
              ),
              Center(
                child: Text(
                  userData["first_name"] ?? "User Name",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Center(
                child: Text(
                  _user?.email ?? "user@example.com",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              const SizedBox(height: 25),
              ListTile(
                title: const Text("Edit Profile"),
                leading: const Icon(Icons.edit),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text('Privacy Policy'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PrivacyPolicyPage()),
                  );
                },
              ),
              ListTile(
                title: const Text("Logout"),
                leading: const Icon(Icons.logout),
                onTap: () async {
                  customReplacementNavigate(context, "/signUp");
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
