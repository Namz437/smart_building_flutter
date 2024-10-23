import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:latihan_bloc/pages/control_page.dart';
import 'package:latihan_bloc/pages/login_page.dart';
import 'package:latihan_bloc/pages/perusahaan.dart';

class SlideshowPage extends StatefulWidget {
  const SlideshowPage({super.key});

  @override
  _SlideshowPageState createState() => _SlideshowPageState();
}

class _SlideshowPageState extends State<SlideshowPage> {
  int currentIndex = 0;

  final List<String> slideTitles = [
    'Mudah digunakan',
    'Kontrol Mudah',
    'Monitoring Aman',
  ];

  final List<String> slideDescriptions = [
    'Aplikasi yang mudah di gunakan penggunaanya.',
    'Menonaktifkan dan menyalakan device, mudah dan cepat.',
    'Pendataan yang terstruktur.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Starting'),
        backgroundColor: const Color.fromARGB(255, 63, 169, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30), 


            ImageSlideshow(
              width: double.infinity,
              height: 300, 
              initialPage: 0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    'https://lmkt.com/wp-content/uploads/2017/08/smart-building.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    'https://www.shutterstock.com/image-vector/low-poly-smart-city-3d-600nw-2433865153.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    'https://lmkt.com/wp-content/uploads/2017/08/smart-building.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value; 
                });
              },
              autoPlayInterval: 3000,
              isLoop: true,
            ),

            const SizedBox(height: 40), 
            Text(
              slideTitles[currentIndex], 
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              slideDescriptions[
                  currentIndex],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16), 
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PerusahaanPage(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Mulai Sekarang',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
