import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_beat/Service/local_library_service.dart';
import 'package:hi_beat/models/base_viewmodel.dart';
import 'package:on_audio_query/on_audio_query.dart';

final albumDetailViewModel =
ChangeNotifierProvider((_) => AlbumDetailViewModel());

class AlbumDetailViewModel extends BaseViewModel {
  final service = LocalLibraryService();

  List<SongModel> _localSongs = [];

  // getters
  List<SongModel> get localSongs => _localSongs;

  Future<void> fetchAlbumSongs({required int id}) async {
    await service.getAlbumSongs(id).then((res) {
      if(res.isNotEmpty){
        _localSongs = res;
        log(localSongs.toString());
      }

    }).whenComplete(() {
      notifyListeners();
    });






  }
}