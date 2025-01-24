import 'package:flutter/material.dart';

import '../model/data/photo.dart';

class DetailPhotoPage extends StatelessWidget {
  final Photo photo;

  const DetailPhotoPage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Photo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero animation for the photo

            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(photo.user?.profileImage?.small ?? ''),
                    ),
                    title: Text(photo.user?.username ?? ''),
                    subtitle: Text(photo.user?.firstName ?? ''),
                    trailing: const Icon(Icons.more_vert_rounded),
                  ),
                  Hero(
                    tag: photo.id ?? '',
                    child: Image.network(
                      photo.urls?.regular ?? '',
                      fit: BoxFit.cover,
                      height: 500,
                      width: double.infinity,
                    ),
                  ),

                  const SizedBox(height: 8),
                  // Photo likes
                  Row(
                    children: [
                      const Icon(Icons.favorite, color: Colors.red),
                      const SizedBox(width: 4),
                      Text('${photo.likes ?? 0} likes'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    photo.altDescription ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
