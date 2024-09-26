import 'package:flutter/material.dart';
import './batterypage.dart'; // Import the batterypage.dart file

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OVERVIEW'),
        leading: IconButton(
          icon: Icon(Icons.menu, size: 30, color: Colors.white), // Increased icon size
          onPressed: () {
            // Implement menu functionality
          },
        ),
        backgroundColor: Colors.blueAccent, // Changed background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTitle('Mafishi 2.0'),
            SizedBox(height: 20),
            _buildIconRow([
              _buildIconButton(Icons.lightbulb_outline, () {}, 'Light', Colors.yellow),
              _buildIconButton(Icons.warning, () {}, 'Warning', Colors.red),
            ]),
            SizedBox(height: 20),
            _buildIconRow([
              _buildIconButton(Icons.arrow_back, () {}, 'Back', Colors.grey),
              _buildIconButton(Icons.arrow_forward, () {}, 'Forward', Colors.grey),
            ]),
            SizedBox(height: 20),
            _buildSpeedometer(20),
            SizedBox(height: 20),
            _buildBatteryWidget(context, 100, 25),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent), // Changed text color
    );
  }

  Widget _buildIconRow(List<Widget> icons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: icons,
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed, String tooltip, Color backgroundColor) {
    return Tooltip(
      message: tooltip,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          icon: Icon(icon, size: 40), // Increased icon size
          onPressed: onPressed,
          color: Colors.white, // Changed icon color
        ),
      ),
    );
  }

  Widget _buildSpeedometer(int speed) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueAccent, // Changed background color
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text('SPEED', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)), // Changed text color
          Icon(Icons.speed, size: 30), // Decreased icon size
          Text('$speed KM/H', style: TextStyle(fontSize: 18, color: Colors.white)), // Changed text color
        ],
      ),
    );
  }

  Widget _buildBatteryWidget(BuildContext context, int batteryPercentage, int temperature) {
    return MouseRegion(
      onEnter: (_) {
        // Implement hover enter functionality
      },
      onExit: (_) {
        // Implement hover exit functionality
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BatteryManagementPage()),
          );
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blueAccent, // Changed background color
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('BATTERY MANAGEMENT', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)), // Changed text color
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$batteryPercentage%', style: TextStyle(color: Colors.white)), // Changed text color
                  Icon(Icons.battery_full, size: 30), // Decreased icon size
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$temperature°C', style: TextStyle(color: Colors.white)), // Changed text color
                  Icon(Icons.thermostat, size: 30), // Decreased icon size
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}