import 'package:flutter/material.dart';
import 'package:flutter_agit/controller/feed_controller.dart';

import 'package:provider/provider.dart';

import 'feed_card.dart';

class FeedBookmarkListWidget extends StatelessWidget {
  const FeedBookmarkListWidget({
    super.key,
    
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FeedController>();

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        controller.refresh();
      },
      child: controller.isBookmarkEmpty()
          ? const Center(
              child: Text('No Content Saved'),
            )
          : ListView.builder(
              itemCount: controller.bookmarkedFeeds.length,
              itemBuilder: (context, index) => FeedCard(
                feed: controller.bookmarkedFeeds[index],
              ),
            ),
    );
  }
}
