// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../controller/feed_controller.dart';
// import 'feed_card.dart';

// class BookmarkPage extends StatelessWidget {
//   const BookmarkPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Provider.of<FeedController>(context);
//     final bookmarkedFeeds = controller.bookmarkedFeeds;

//     return ListView.builder(
//       itemCount: bookmarkedFeeds.length,
//       itemBuilder: (context, index) {
//         final feed = bookmarkedFeeds[index];

//         return FeedCard(feed: feed);
//       },
//     );
//   }
// }
