import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingLoginPanel extends StatefulWidget {
  const SlidingLoginPanel({super.key});

  @override
  State<SlidingLoginPanel> createState() => _SlidingLoginPanel();
}

class _SlidingLoginPanel extends State<SlidingLoginPanel> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool? isUsernameEmpty;
  bool? isPasswordEmpty;

  @override
  void initState() {
    isUsernameEmpty = false;
    isPasswordEmpty = false;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: Text('Welcome to the Home Screen'),
          ),
          SlidingUpPanel(
            minHeight: 60,
            maxHeight: 300,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            panel: _buildLoginPanel(context),
            collapsed: _buildCollapsedBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildCollapsedBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: const Center(
        child: Icon(Icons.arrow_upward)
      ),
    );
  }

  Widget _buildLoginPanel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Text("Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const TextField(
            // controller: usernameController,
            decoration: InputDecoration(labelText: 'Username')
          ),
          const TextField(
            // controller: passwordController,
            obscureText: true, 
            decoration: InputDecoration(labelText: 'Password')
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}
