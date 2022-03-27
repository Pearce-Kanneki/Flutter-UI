
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/effects/download_button/DemoAppIcon.dart';

import 'DownloadButton.dart';
import 'DownloadController.dart';
import 'SimulatedDownloadController.dart';

void main() {
  runApp(MaterialApp(
    home: ExampleCupertinoDownloadButton(),
    debugShowCheckedModeBanner: false,
  ));
}

@immutable
class ExampleCupertinoDownloadButton extends StatefulWidget {
  const ExampleCupertinoDownloadButton({Key? key}) : super(key: key);

  @override
  _ExampleCupertinoDownloadButtonState createState() =>
      _ExampleCupertinoDownloadButtonState();
}

class _ExampleCupertinoDownloadButtonState
    extends State<ExampleCupertinoDownloadButton> {
  late final List<DownloadController> _downloadControllers;

  @override
  void initState() {
    super.initState();
    _downloadControllers = List<DownloadController>.generate(
        20,
            (index) => SimulatedDownloadController(onOpenDownload: (){
          _openDownload(index);
        })
    );
  }

  void _openDownload(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Open App ${index + 1}"))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Apps"),),
      body: ListView.separated(
          itemBuilder: _buildListItem,
          separatorBuilder: (_, __) => const Divider(),
          itemCount: _downloadControllers.length
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    final theme = Theme.of(context);
    final downloadController = _downloadControllers[index];

    return ListTile(
      leading: const DemoAppIcon(),
      title: Text(
        "App ${index + 1}",
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.headline6,
      ),
      subtitle: Text(
        "Lorem ipsum dolor #${index + 1}",
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.caption,
      ),
      trailing: SizedBox(
        width: 96,
        child: AnimatedBuilder(
          animation: downloadController,
          builder: (context, child) {
            return DownloadButton(
              status: downloadController.downloadStatus,
              downloadProgress: downloadController.progress,
              onDownload: downloadController.startDownload,
              onCancel: downloadController.stopDownload,
              onOpen: downloadController.openDownload,
            );
          },
        ),
      ),
    );
  }
}