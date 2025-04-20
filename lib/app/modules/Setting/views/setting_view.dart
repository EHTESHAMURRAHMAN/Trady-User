import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trady/app/Api/Base_Api.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = const Color(0xFF6A1B9A);
    return Scaffold(
      backgroundColor: const Color(0xFFEADAFD),
      appBar: AppBar(
        backgroundColor: themeColor,
        elevation: 0,
        title: const Text('Settings'),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              color: themeColor,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/icons/workericon.png'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Trady',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userInfo!.email,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _sectionTitle("Account"),
            _settingTile(
              icon: Icons.person_outline,
              title: 'Edit Profile',
              subtitle: 'Name, Photo, Password',
              onTap: () {},
            ),
            _settingTile(
              icon: Icons.phone_android,
              title: 'Contact Info',
              subtitle: 'Email & Phone Number',
              onTap: () {},
            ),
            const SizedBox(height: 10),
            _sectionTitle("Preferences"),
            _settingTile(
              icon: Icons.language,
              title: 'Language',
              subtitle: 'Change App Language',
              onTap: () {},
            ),
            _settingTile(
              icon: Icons.notifications_none,
              title: 'Notification Settings',
              subtitle: 'Push, SMS & Email',
              onTap: () {},
            ),
            _settingTile(
              icon: Icons.brightness_6_outlined,
              title: 'Dark Mode',
              subtitle: 'App appearance',
              onTap: () {},
            ),
            const SizedBox(height: 10),
            _sectionTitle("Support"),
            _settingTile(
              icon: Icons.help_outline,
              title: 'Help Center',
              subtitle: 'FAQs and Support',
              onTap: () {},
            ),
            _settingTile(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
              subtitle: 'Terms & Conditions',
              onTap: () {},
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Add logout functionality here
                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 2,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _settingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Icon(icon, color: const Color(0xFF6A1B9A), size: 22),
      ),
      title: Text(title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      subtitle: Text(subtitle,
          style: const TextStyle(color: Colors.black54, fontSize: 13)),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      onTap: onTap,
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 6),
      child: Text(title,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black54)),
    );
  }
}
