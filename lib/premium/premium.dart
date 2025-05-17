import 'package:flutter/material.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  String selectedPlan = 'Basic';
  bool isSubscribed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Premium Plan',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.grey[800],
        foregroundColor: Colors.white,
        elevation: 3,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              'Choose Your Plan:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            _buildPlanCard(),
            const SizedBox(height: 30),
            _buildNewsletterCheckbox(),
            const SizedBox(height: 40),
            _buildProceedButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            _buildPlanOption('Basic'),
            const Spacer(),
            _buildPlanOption('Premium'),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanOption(String plan) {
    return Row(
      children: [
        Radio<String>(
          value: plan,
          groupValue: selectedPlan,
          activeColor: Colors.grey[700],
          onChanged: (value) {
            setState(() {
              selectedPlan = value!;
            });
          },
        ),
        Text('$plan Plan', style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildNewsletterCheckbox() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              value: isSubscribed,
              activeColor: Colors.grey[700],
              onChanged: (value) {
                setState(() {
                  isSubscribed = value!;
                });
              },
            ),
            const Expanded(
              child: Text(
                'Subscribe to our newsletter for updates and offers',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProceedButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _showConfirmationDialog(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[800],
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Proceed',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 5,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 60,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Subscription Confirmed',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'You selected the $selectedPlan plan.\n'
                    'Newsletter subscription: ${isSubscribed ? "✔ Subscribed" : "✖ Not Subscribed"}',
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[800],
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Got it',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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