import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

final boxesNames = [
  'daily_tasks',
  'week_tasks',
  'prefs',
  'profile',
];

extension HiveExtension on HiveInterface {
  Future<void> clear() async {
    for(String name in boxesNames){
      Hive.box(name).clear();
    }
  }

  Future<void> dispose() async {
    // Compact the boxes before closing
    for(String name in boxesNames){
      Hive.box(name).compact();
    }

    // close the all the opened Hive boxes
    await Hive.close();
  }

  Future<void> createBoxes() async {
    List<Future> futures = [];
    for(String name in boxesNames){
      futures.add(Hive.openBox(name));
    }
    await Future.wait(futures);
  }
}

Future<void> initHive() async {
  if (kIsWeb) {
    Hive.init("");
  } else {
    final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
  }

  //Hive.registerAdapter(BusinessAdapter());
  // Hive.registerAdapter(TextMessageAdapter());
  // Hive.registerAdapter(PhotoMessageAdapter());

  // Hive.registerAdapter(MatchesHistoryAdapter());
  // Hive.registerAdapter(ProfileAdapter());

  await Hive.createBoxes();
}
