class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Title Section
              Text(
                'OVERVIEW',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Mafishi 2.0',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              
              // Button Section (Top row with icons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ControlButton(icon: Icons.lightbulb_outline),
                  ControlButton(icon: Icons.warning),
                ],
              ),
              
              SizedBox(height: 16),
              
              // Button Section (Arrow buttons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ControlButton(icon: Icons.arrow_back),
                  ControlButton(icon: Icons.arrow_forward),
                ],
              ),
              
              SizedBox(height: 20),
              
              // Speed and Battery Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(
                    title: 'SPEED',
                    value: '20 KM/H',
                    icon: Icons.speed,
                  ),
                  InfoCard(
                    title: 'BATTERY MANAGEMENT',
                    value: '100%\n25°C',
                    icon: Icons.battery_charging_full,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ControlButton extends StatelessWidget {
  final IconData icon;
  
  ControlButton({required this.icon});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 32,
        color: Colors.black54,
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  
  InfoCard({required this.title, required this.value, required this.icon});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              Icon(icon, size: 24, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }
}
