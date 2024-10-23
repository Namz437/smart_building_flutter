import 'package:flutter/material.dart';
import 'package:latihan_bloc/pages/control_page.dart';

class GedungPage extends StatefulWidget {
  const GedungPage({super.key});

  @override
  _GedungPageState createState() => _GedungPageState();
}

class _GedungPageState extends State<GedungPage> {
  final Map<int, bool> _floorVisibility = {1: false, 2: false};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gedung'),
        backgroundColor: const Color.fromARGB(255, 63, 169, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CompanyCard(
                    companyName: 'Gedung 1',
                    imageUrl:
                        'https://asset.kompas.com/crops/PScDVjnwXVZ3QdXuaLh4tbKmToY=/0x0:612x408/750x500/data/photo/2023/08/07/64d09a80a12d4.jpeg',
                    onTap: () {
                      _toggleFloorVisibility(1);
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: CompanyCard(
                    companyName: 'Gedung 2',
                    imageUrl:
                        'https://edoo.id/wp-content/uploads/2023/12/Gedung-Tertinggi-di-Asia-Tenggara-1024x688.jpg',
                    onTap: () {
                      _toggleFloorVisibility(2);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_floorVisibility[1] == true) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.only(top: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Lantai 1',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                RoomCard(
                                  roomName: 'Ruang 304',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ControlPage()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                  if (_floorVisibility[2] == true) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.only(top: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Lantai 1',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                RoomCard(
                                  roomName: 'Ruang 204',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ControlPage()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleFloorVisibility(int gedungNumber) {
    setState(() {
      _floorVisibility[gedungNumber] = !_floorVisibility[gedungNumber]!;
    });
  }
}

// Widget for company card
class CompanyCard extends StatelessWidget {
  final String companyName;
  final String imageUrl;
  final VoidCallback onTap;

  const CompanyCard({
    Key? key,
    required this.companyName,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Stack(
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black54, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    companyName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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

// Widget for room card
class RoomCard extends StatelessWidget {
  final String roomName;
  final VoidCallback onTap;
  final double width;
  final double height;

  const RoomCard({
    Key? key,
    required this.roomName,
    required this.onTap,
    this.width = 30,
    this.height = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            roomName,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
