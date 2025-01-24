import 'package:flutter_agit/model/feed.dart';

class FeedRepository {
 List<Feed> fetch() {
    return [
    Feed(
      id:1,
    user: User(
      name: 'Agit Firmanda', 
      avatar: 'https://images.pexels.com/photos/9876711/pexels-photo-9876711.jpeg?auto=compress&cs=tinysrgb&w=600', 
      place:'Bandung, Indonesia'), 
    content: Content(
      isLike: false,
      isBookmark: false,
      image: 'https://images.pexels.com/photos/23105932/pexels-photo-23105932/free-photo-of-waves-on-ocean-shore.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load', 
      likes: '8.560 Likes', 
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
      )),
    Feed(
      id:2,
    user: User(
      name: 'khalista', 
      avatar: 'https://images.pexels.com/photos/24233151/pexels-photo-24233151/free-photo-of-woman-in-mini-skirt-and-short-sleeve-shirt-sitting-on-rock.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load', 
      place:'Bandung, Indonesia'), 
    content: Content(
      isLike: false,
      isBookmark: false,
      image: 'https://images.pexels.com/photos/22944781/pexels-photo-22944781/free-photo-of-holy-trinity-church-tower-in-gorlitz.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load', 
      likes: '1.000 Likes', 
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
      )),
    Feed(
      id:3,
    user: User(
      name: 'jasmine-shakira', 
      avatar: 'https://images.pexels.com/photos/29157414/pexels-photo-29157414/free-photo-of-young-woman-enjoying-autumn-on-a-park-bench.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load', 
      place:'Bandung, Indonesia'), 
    content: Content(
      isLike: false,
      isBookmark: false,
      image: 'https://images.pexels.com/photos/6010287/pexels-photo-6010287.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load', 
      likes: '1.000 Likes', 
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
      )),

  ];
  }
}