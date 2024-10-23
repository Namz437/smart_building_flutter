import 'package:flutter/material.dart';
import 'package:latihan_bloc/pages/control_page.dart';
import 'package:latihan_bloc/pages/gedung.dart';

class PerusahaanPage extends StatelessWidget {
  const PerusahaanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perusahaan'),
        backgroundColor: const Color.fromARGB(255, 63, 169, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CompanyCard(
              companyName: 'PT. Minori',
              imageUrl:
                  'https://connect-assets.prosple.com/cdn/ff/H18oE6gkw1zZezriRozJV8MmZs2bB9T9Edo132x1dBk/1639743459/public/styles/scale_and_crop_center_398x128/public/2021-08/logo%20minori%20Indonesia.jpg?itok=vN7LlkpD',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GedungPage()),
                );
              },
            ),
            const SizedBox(height: 16.0),
            CompanyCard(
              companyName: 'Politeknik Takumi',
              imageUrl:
                  'https://media.licdn.com/dms/image/v2/D5616AQEaDAYmIbzXrw/profile-displaybackgroundimage-shrink_200_800/profile-displaybackgroundimage-shrink_200_800/0/1709024763089?e=2147483647&v=beta&t=wBY05xKKbeppRL5XyrN5Xt5E8HmkNzNVObvTBpiQOvk',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ControlPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

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
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                companyName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: PerusahaanPage(),
  ));
}
