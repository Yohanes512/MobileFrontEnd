import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool allowNotification = false;
  bool vibrate = false;
  bool lockScreen = false;
  bool sound = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildSwitchTile('Allow notification', allowNotification, (value) {
              setState(() {
                allowNotification = value;
              });
            }),
            buildSwitchTile('Vibrate', vibrate, (value) {
              setState(() {
                vibrate = value;
              });
            }),
            buildSwitchTile('Lock screen', lockScreen, (value) {
              setState(() {
                lockScreen = value;
              });
            }),
            buildSwitchTile('Sound', sound, (value) {
              setState(() {
                sound = value;
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Switch(
            value: value,
            onChanged: (newValue) {
              onChanged(newValue);

              final snackBar = SnackBar(
                content: Text('$title ${newValue ? 'ON' : 'OFF'}'),
                duration: const Duration(seconds: 1),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
