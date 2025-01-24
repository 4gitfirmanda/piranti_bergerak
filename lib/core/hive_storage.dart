import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  late Box box;
  HiveStorage._();
  static HiveStorage? _instance;
  static HiveStorage get instance {
    _instance ??= HiveStorage._();
    return _instance!;
  }
  
  Future<void> initBox() async {
    await Hive.initFlutter();
    box = await Hive.openBox('pbsiBox');
  }
  
}