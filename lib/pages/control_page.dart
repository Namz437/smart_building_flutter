import 'package:flutter/material.dart';

class ControlPage extends StatelessWidget {
  const ControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontrol Device'),
        backgroundColor: const Color.fromARGB(255, 63, 169, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Halo, Anam",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                // CircleAvatar(
                //   radius: 20,
                //   backgroundImage: NetworkImage(
                //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI9lRck6miglY0SZF_BZ_sK829yiNskgYRUg&s',
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SmartDeviceSection(),
            ),
          ],
        ),
      ),
    );
  }
}

class SmartDeviceSection extends StatefulWidget {
  @override
  _SmartDeviceSectionState createState() => _SmartDeviceSectionState();
}

class _SmartDeviceSectionState extends State<SmartDeviceSection> {
  bool isSmartDoorOn1 = false;
  bool isSmartDoorOn2 = false;
  bool isSmartACOn1 = false;
  bool isSmartACOn2 = false;
  bool isSmartFanOn = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SmartDeviceCard(
          icon: Icons.door_front_door_outlined,
          title: "Smart Door 1",
          subtitle: "Pintu Belakang 304",
          roomNumber: "304",
          isSwitched: isSmartDoorOn1,
          onToggle: (value) {
            setState(() {
              isSmartDoorOn1 = value;
            });
          },
        ),
        const SizedBox(height: 16.0),
        SmartDeviceCard(
          icon: Icons.door_front_door_outlined,
          title: "Smart Door 2",
          subtitle: "Pintu Depan 304",
          roomNumber: "304",
          isSwitched: isSmartDoorOn2,
          onToggle: (value) {
            setState(() {
              isSmartDoorOn2 = value;
            });
          },
        ),
        const SizedBox(height: 16.0),
        SmartDeviceCard(
          icon: Icons.ac_unit,
          title: "Smart AC 1",
          subtitle: "Ac 1",
          roomNumber: "304",
          isSwitched: isSmartACOn1,
          onToggle: (value) {
            setState(() {
              isSmartACOn1 = value;
            });
          },
        ),
        const SizedBox(height: 16.0),
        SmartDeviceCard(
          icon: Icons.ac_unit,
          title: "Smart AC 2",
          subtitle: "Ac 2",
          roomNumber: "304",
          isSwitched: isSmartACOn2,
          onToggle: (value) {
            setState(() {
              isSmartACOn2 = value;
            });
          },
        ),
        const SizedBox(height: 16.0),
        SmartDeviceCard(
          icon: Icons.wind_power,
          title: "Smart Fan",
          subtitle: "Kencang",
          roomNumber: "304",
          isSwitched: isSmartFanOn,
          onToggle: (value) {
            setState(() {
              isSmartFanOn = value;
            });
          },
        ),
      ],
    );
  }
}

class SmartDeviceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String roomNumber;
  final bool isSwitched;
  final ValueChanged<bool> onToggle;

  const SmartDeviceCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.roomNumber,
    required this.isSwitched,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 195, 206, 214),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color.fromARGB(255, 0, 0, 0), size: 50),
              const Spacer(),
              Text(
                roomNumber,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              color: Color.fromARGB(179, 0, 0, 0),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isSwitched ? 'ON' : 'OFF',
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              Switch(
                value: isSwitched,
                onChanged: onToggle,
                activeColor: Colors.white,
                activeTrackColor: Colors.lightBlueAccent,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey.shade300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ControlPage(),
  ));
}
