import 'package:flutter/material.dart';

///  Dialog不顯示要用[Center]包起來就沒問題了
class DemoShowDialog extends StatelessWidget {
  const DemoShowDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Show Dialog",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Show Dialog"),
        ),
        body: const Center(child: BodyPage(),),
      ),
    );
  }
}

class BodyPage extends StatelessWidget {
  const BodyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Text("Show Dialog"),
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text("Demo AlertDialog"),
                      content: const Text("Demo Content"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("OK")),
                      ],
                    )))
          ],
        )
      ],
    );
  }
}

showAlertDialog(BuildContext context) {
  AlertDialog dialog = AlertDialog(
    title: const Text("Demo AlertDialog"),
    content: const Text("Demo Content"),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("OK"))
    ],
  );
}
