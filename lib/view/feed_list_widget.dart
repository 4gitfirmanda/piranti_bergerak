import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_agit/controller/photo_controller.dart';
import 'package:flutter_agit/view/photo_card.dart';
import 'package:provider/provider.dart';

class FeedListWidget extends StatefulWidget {
  const FeedListWidget({super.key});

  @override
  State<FeedListWidget> createState() => _FeedListWidgetState();
}

class _FeedListWidgetState extends State<FeedListWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final controller = Provider.of<PhotoController>(
        context,
        listen: false,
      );
      controller.fetch(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PhotoController>();

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        controller.fetch(Random().nextInt(50));
      },
      child: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.photos.length,
              itemBuilder: (context, index) {
                final photo = controller.photos[index];
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Detail Foto ${photo.id}',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 10),
                                photo.urls?.regular != null
                                    ? Image.network(
                                        photo.urls!.regular!,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Center(
                                            child: Text('Gagal memuat gambar'),
                                          );
                                        },
                                      )
                                    : const Center(
                                        child: Text('Gambar tidak tersedia'),
                                      ),
                                const SizedBox(height: 10),
                                Text(
                                  photo.description ??
                                      'Tidak ada deskripsi tersedia.',
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: PhotoCard(photo: photo),
                );
              },
            ),
    );
  }
}
