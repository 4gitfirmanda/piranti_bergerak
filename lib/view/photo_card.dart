import 'package:flutter/material.dart';
import 'package:flutter_agit/model/data/photo.dart';
import 'detail_photo_page.dart';

class PhotoCard extends StatefulWidget {
  final Photo photo;

  const PhotoCard({
    super.key,
    required this.photo,
  });

  @override
  State<PhotoCard> createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPhotoPage(
              photo: widget.photo,
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(widget.photo.user?.profileImage?.small ?? ''),
              ),
              title: Text(widget.photo.user?.username ?? ''),
              subtitle: Text(widget.photo.user?.firstName ?? ''),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert_rounded),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailPhotoPage(
                        photo: widget.photo,
                      ),
                    ),
                  );
                },
              ),
            ),
            Image.network(
              widget.photo.urls?.regular ?? '',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.8,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    // context.read<FeedController>().like(widget.photos);
                  },
                  icon: Icon(
                    (widget.photo.likedByUser ?? false)
                        ? Icons.favorite
                        : Icons.favorite_outline_rounded,
                    color: (widget.photo.likedByUser ?? false)
                        ? Colors.red
                        : null, // Tidak ada warna jika false
                    size: 24.0,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.mode_comment_outlined,
                  size: 24.0,
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.send_outlined,
                  size: 24.0,
                ),
                const Spacer(flex: 1),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () {
                      // context.read<FeedController>().bookmark(widget.photos);
                    },
                    icon: Icon(
                      (widget.photo.likedByUser ?? false)
                          ? Icons.bookmark
                          : Icons.bookmark_outline_rounded,
                      color: (widget.photo.likedByUser ?? false)
                          ? const Color.fromARGB(255, 0, 0, 0)
                          : null, // Tidak ada warna jika false
                      size: 24.0,
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              title: Text((widget.photo.likes ?? 0).toString()),
              subtitle: Text(widget.photo.altDescription ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
