import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  final items = List<ListItem>.generate(
      1000,
      (i) => i % 6 == 0
          ? HeadingItem("Heading $i")
          : MessageItem("Send $i", "Message body $i"));

  runApp(MyApp(items: items,));
}

class MyApp extends StatelessWidget {
  final List<ListItem> items;
  const MyApp({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = "Mixed List";
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(title: const Text(title),),
        body: ListView.builder(
          itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              
              return ListTile(
                title: item.buildTitle(context),
                subtitle: item.buildSubTitle(context),
              );
            },
        ),
      ),
    );
  }
}


abstract class ListItem {
  Widget buildTitle(BuildContext context);

  Widget buildSubTitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildSubTitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubTitle(BuildContext context) => Text(body);
}
