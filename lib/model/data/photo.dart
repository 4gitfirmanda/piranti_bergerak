import 'photo_url.dart';
import 'profile_image.dart';

class Photo {
  String? id;
  bool? likedByUser;
  String? description;
  String? altDescription;
  int? likes;
  User? user;
  Urls? urls;

  Photo({
    this.id,
    this.likedByUser,
    this.description,
    this.altDescription,
    this.likes,
    this.user,
    this.urls,
  });

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    likedByUser = json['liked_by_user'];
    likes = json['likes'];
    description = json['description'];
    altDescription = json['alt_description'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['liked_by_user'] = likedByUser;
    data['likes'] = likes;
    data['description'] = description;
    data['alt_description'] = altDescription;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (urls != null) {
      data['urls'] = urls!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? username;
  String? name;
  String? firstName;
  ProfileImage? profileImage;

  User({
    this.id,
    this.username,
    this.name,
    this.firstName,
    this.profileImage,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name']; // Perbaikan di sini
    profileImage = json['profile_image'] != null
        ? ProfileImage.fromJson(json['profile_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['name'] = name;
    data['first_name'] = firstName; // Perbaikan di sini
    if (profileImage != null) {
      data['profile_image'] = profileImage!.toJson();
    }
    return data;
  }
}
