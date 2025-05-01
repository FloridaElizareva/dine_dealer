import 'package:dine_dealer/core/assets/fonts.gen.dart';
import 'package:dine_dealer/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _pushNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DDColors.bg,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F6EE),
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: DDColors.ddBlack,
              fontFamily: FontFamily.robotoSerif),
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Account',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: DDColors.grey_yellow,
                fontFamily: FontFamily.manrope),
          ),
          const SizedBox(height: 8),
          _buildCard([
            _buildListTile(
              Icons.person,
              'Name',
              'Oliver',
            ),
            _buildListTile(Icons.phone, 'Phone number', '+46 40 123 4567'),
            _buildListTile(Icons.wallet, 'Balance & Plans', '7 calls left'),
            _buildListTile(Icons.restore, 'Restore purchases', null),
            _buildListTile(Icons.access_time, 'Time Format', '24-Hour Time'),
            SwitchListTile(
              value: _pushNotifications,
              onChanged: (value) {
                setState(() {
                  _pushNotifications = value;
                });
              },
              secondary: const Icon(Icons.notifications),
              title: const Text('Push Notifications'),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              activeTrackColor: DDColors.green_activated,
            ),
          ]),
          const SizedBox(height: 24),
          Text(
            'About',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: DDColors.grey_yellow,
              fontFamily: FontFamily.manrope,
            ),
          ),
          const SizedBox(height: 8),
          _buildCard([
            _buildListTile(Icons.description, 'Terms & Conditions', null),
            _buildListTile(Icons.privacy_tip, 'Privacy Policy', null),
            _buildListTile(Icons.help_outline, 'Help Center', null),
          ]),
          const SizedBox(height: 24),
          Container(
            color: DDColors.bg,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout),
              label: const Text('Log out'),
              style: ElevatedButton.styleFrom(
                foregroundColor: DDColors.ddBlack,
                backgroundColor: DDColors.bg,
                iconAlignment: IconAlignment.start,
                side: BorderSide(color: DDColors.lightGrey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Card(
      color: DDColors.bg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.zero,
      elevation: 0.5,
      child: Column(children: children),
    );
  }

  Widget _buildListTile(IconData icon, String title, String? trailingText) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          color: DDColors.ddBlack,
          fontFamily: FontFamily.manrope,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailingText != null
          ? Text(
              trailingText,
              style: TextStyle(
                color: DDColors.grey_yellow,
                fontFamily: FontFamily.manrope,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            )
          : null,
      onTap: () {},
    );
  }
}
