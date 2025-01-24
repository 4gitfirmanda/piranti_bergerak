import 'package:flutter/material.dart';
import 'package:flutter_agit/controller/feed_controller.dart';
import 'package:flutter_agit/model/feed.dart';

import 'package:provider/provider.dart';

class FeedCard extends StatefulWidget {
  final Feed feed;

  const FeedCard({
    super.key,
    required this.feed,
  });

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    final user = widget.feed.user;
    final content = widget.feed.content;
    var controller = context.read<FeedController>();

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.avatar),
            ),
            title: Text(
              user.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(user.place),
            trailing: const Icon(Icons.more_vert_outlined),
          ),
          Image.network(
            content.image,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.6,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    controller.like(widget.feed);
                  },
                  icon: Icon(
                      content.isLike ? Icons.favorite : Icons.favorite_outline),
                ),
                Text(
                  content.likes,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.maps_ugc_rounded),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share_outlined),
                ),
                IconButton(
                  onPressed: () {
                    controller.bookmark(widget.feed);
                  },
                  icon: Icon(controller.isBookmark(widget.feed)
                      ? Icons.bookmark
                      : Icons.bookmark_outline_outlined),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
