import 'package:flutter/cupertino.dart';
import 'package:flutter_ui/effects/download_button/DownloadController.dart';
import 'package:flutter_ui/effects/download_button/DownloadStatus.dart';

class SimulatedDownloadController extends DownloadController with ChangeNotifier{

  SimulatedDownloadController({
    DownloadStatus downloadStatus = DownloadStatus.notDownloaded,
    double progress = 0.0,
    required VoidCallback onOpenDownload
  }): _downloadStatus = downloadStatus,
      _progress = progress,
      _onOpenDownload = onOpenDownload;

  DownloadStatus _downloadStatus;
  @override
  DownloadStatus get downloadStatus => _downloadStatus;

  double _progress;
  @override
  double get progress => _progress;

  final VoidCallback _onOpenDownload;
  bool _isDownloading = false;

  @override
  void openDownload() {
    if(downloadStatus == DownloadStatus.downloaded) {
      _onOpenDownload();
    }
  }

  @override
  void startDownload() {
    if(downloadStatus == DownloadStatus.notDownloaded) {
      _doSimulatedDownload();
    }
  }

  @override
  void stopDownload() {
    if(_isDownloading) {
      _isDownloading = false;
      _downloadStatus = DownloadStatus.notDownloaded;
      _progress = .0;
      notifyListeners();
    }
  }

  Future<void> _doSimulatedDownload() async {
    _isDownloading = true;
    _downloadStatus = DownloadStatus.fetchingDownload;
    notifyListeners();

    // Wait a second to simulate fetch time.
    await Future<void>.delayed(const Duration(seconds: 1));

    // If the user chose to cancel the download, stop simulation.
    if (!_isDownloading){
      return;
    }

    // Shift to the downloading phase.
    _downloadStatus = DownloadStatus.downloading;
    notifyListeners();

    const downloadProgressStops = [ .0, .15, .45, .8, 1.0];
    for(final stop in downloadProgressStops) {
      await Future<void>.delayed(const Duration(seconds: 1));

      if(!_isDownloading) {
        return;
      }

      _progress = stop;
      notifyListeners();
    }

    await Future<void>.delayed(const Duration(seconds: 1));

    if(!_isDownloading) {
      return;
    }

    _downloadStatus = DownloadStatus.downloaded;
    _isDownloading = false;
    notifyListeners();
  }

}