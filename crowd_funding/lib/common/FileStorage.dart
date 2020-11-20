import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

enum UploadType {
  /// Uploads a file from the device.
  file,

  /// Clears any tasks from the list.
  clear,
}

/// A StatefulWidget which keeps track of the current uploaded files.

class FileStorage {
  List<firebase_storage.UploadTask> _uploadTasks = [];

  /// The user selects a file, and the task is added to the list.
  firebase_storage.UploadTask uploadFile(
      File file, String userId, String docName) {
    // Create a Reference to the file
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child(userId)
        .child("image")
        .child(docName);

    return ref.putFile(file);
  }

  /// Handles the user pressing the PopupMenuItem item.

  Future<List<String>> downloadFile(firebase_storage.Reference ref) async {
    List<String> aPath = new List<String>();
    try {
      await ref
          .list(firebase_storage.ListOptions(maxResults: 8))
          .then((value) async {
        int i = 0;
        for (var item in value.items) {
          final Directory systemTempDir = Directory.systemTemp;
          final File tempFile = File('${systemTempDir.path}/temp-${item.name}');
          if (!tempFile.existsSync()) await item.writeToFile(tempFile);
          aPath.add(tempFile.path);
        }
      });
    } catch (e) {
      return null;
    }
    return aPath;
  }
}
