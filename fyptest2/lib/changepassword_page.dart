import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordPage extends StatefulWidget {
  final String userId;

  const ChangePasswordPage({Key? key, required this.userId}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController = TextEditingController();

  Future<void> changePassword() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        var email = user.email!;
        var currentPassword = currentPasswordController.text;
        var newPass = newPasswordController.text;
        var confirmNewPass = confirmNewPasswordController.text;

        if (newPass.length < 6) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Password Error"),
                content: Text("The new password must be at least 6 characters long."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
          return;
        }

        if (newPass != confirmNewPass) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Password Error"),
                content: Text("The new password and confirm password do not match."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
          return;
        }

        var credential = EmailAuthProvider.credential(email: email, password: currentPassword);
        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(newPass);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Success"),
              content: Text("Your password has been updated successfully."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.of(context).pop(); // Navigate back to the profile page
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Password Error"),
              content: Text("An error occurred. Please check your current password."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
        print("Password change failed: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9EDF6),
      appBar: AppBar(
        title: const Text(
          "Choose a New Password",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: "Roboto",
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF3E5B7A),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Change Password",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Roboto",
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: currentPasswordController,
                decoration: InputDecoration(
                  labelText: 'Current Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: newPasswordController,
                decoration: InputDecoration(
                  labelText: 'New Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: confirmNewPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm New Password',
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: changePassword,
                child: Text("Change Password"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
