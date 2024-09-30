import 'package:flutter/material.dart';
import 'dart:math';

class BatteryManagementPage extends StatelessWidget {
  const BatteryManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Battery management', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const BatteryLevelIndicator(percentage: 32),
              const SizedBox(height: 40),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildInfoCard('Temperature', Colors.red),
                  _buildInfoCard('Temperature', Colors.red),
                  _buildInfoCard('Runtime', Colors.green),
                  _buildInfoCard('Battery Health', Colors.orange),
                ],
              ),
              // Add more widgets here if you want to make the page scrollable
              // ...
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class BatteryLevelIndicator extends StatelessWidget {
  final int percentage;

  const BatteryLevelIndicator({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: CustomPaint(
        painter: BatteryLevelPainter(percentage: percentage),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Battery level',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              Text(
                '$percentage%',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BatteryLevelPainter extends CustomPainter {
  final int percentage;

  BatteryLevelPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;

    // Draw background circle
    final backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;
    canvas.drawCircle(center, radius - 10, backgroundPaint);

    // Draw battery level arc
    final batteryPaint = Paint()
      ..color = Colors.grey[600]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 10),
      -pi / 2,
      sweepAngle,
      false,
      batteryPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}