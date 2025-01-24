import 'package:flutter/material.dart';
import 'package:flutter_agit/controller/feed_controller.dart';
import 'package:flutter_agit/view/feed_card.dart';

import 'package:provider/provider.dart';

class FeedBookmarkPage extends StatefulWidget {
  const FeedBookmarkPage({super.key});

  @override
  State<FeedBookmarkPage> createState() => _FeedBookmarkPageState();
}

class _FeedBookmarkPageState extends State<FeedBookmarkPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FeedController>(context);
    final bookmarkedFeeds = controller.bookmarkedFeeds;

    return ListView.builder(
      itemCount: bookmarkedFeeds.length,
      itemBuilder: (context, index) {
        final feed = bookmarkedFeeds[index];

        return FeedCard(feed: feed);
      },
    );
  }
}
