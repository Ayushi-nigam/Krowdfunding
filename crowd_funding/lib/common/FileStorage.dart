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
  firebase_storage.UploadTask uploadFile(File file) {
    // Create a Reference to the file
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('akash')
        .child("image")
        .child(file.path);

    return ref.putFile(file);
  }

  /// Handles the user pressing the PopupMenuItem item.

  void _downloadFile(firebase_storage.Reference ref) async {
    final Directory systemTempDir = Directory.systemTemp;
    final File tempFile = File('${systemTempDir.path}/temp-${ref.name}');
    if (tempFile.existsSync()) await tempFile.delete();

    await ref.writeToFile(tempFile);
  }
}
