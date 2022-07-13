import 'package:flutter/material.dart';

void main() {
  runApp(const ButtonApp());
}

class ButtonApp extends StatelessWidget {
  const ButtonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Button",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Button"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "OutlineButton: ",
                  style: Theme.of(context).textTheme.headline6,
                ),
                OutlinedButton(
                    child: const Text("OutlineButton"), onPressed: () {})
              ],
            ),
            Container(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ElevatedButton: ",
                  style: Theme.of(context).textTheme.headline6,
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text("ElevatedButton"))
              ],
            ),
            Container(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "TextButton: ",
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextButton(onPressed: () {}, child: const Text("TextButton"))
              ],
            ),
            Container(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "IconButton: ",
                  style: Theme.of(context).textTheme.headline6,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  color: Colors.blueGrey,
                )
              ],
            ),
            Container(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "FloatingActionButton: ",
                  style: Theme.of(context).textTheme.headline6,
                ),
                FloatingActionButton(
                  onPressed: () => {},
                  child: const Icon(Icons.play_arrow_outlined),
                )
              ],
            ),
            Container(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "FloatingActionButton small: ",
                  style: Theme.of(context).textTheme.headline6,
                ),
                FloatingActionButton.small(
                  onPressed: () => {},
                  child: const Icon(Icons.play_arrow),
                )
              ],
            ),
            Container(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "FloatingActionButton large: ",
                  style: Theme.of(context).textTheme.headline6,
                ),
                FloatingActionButton.large(
                  onPressed: () => {},
                  child: const Icon(Icons.play_arrow),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
