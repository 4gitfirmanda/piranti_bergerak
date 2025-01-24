import 'package:flutter/material.dart';
import '../model/data/photo.dart';
import '../model/repository/photo_repository.dart';


class PhotoController extends ChangeNotifier {
  final List<Photo> _photos = [];
  final List<Photo> _bookmarkPhotos = [];
  bool _isLoading = false;

  List<Photo> get photos => _photos;
  List<Photo> get bookmarkPhotos => _bookmarkPhotos;
  bool get isLoading => _isLoading;

  fetch(int page) async {
    setLoading(true);
    photos.clear();
    photos.addAll(await PhotoRepository().photos());
    setLoading(false);
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}