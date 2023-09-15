import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class TodoItem {
  String text = '';
  bool checked = false;

  TodoItem({required this.text});
}

const headerImageRatio = 2;
const headerImageHeightS = 240.0;
const headerImageHeightM = 320.0;
const headerImageUrl = 'https://picsum.photos/900/600?image=0';
const seed = [
  'Code this Flutter thing',
  'Do WAD',
  'Write my heuristic evaluation',
  'Reminder to eat',
  'Git commit my code',
];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pointer = 0;
  List<TodoItem> items = [];

  void add() => setState(() {
        items.insert(
          0,
          (TodoItem(text: "TODO number ${items.length + 1}")),
        );
      });

  void edit(int index) => setState(() {
        items[index].text = seed[pointer++ % seed.length];
      });

  void delete(int index) => setState(() {
        items.removeAt(index);
      });

  void check(int index) => setState(() {
        items[index].checked = !items[index].checked;
      });

  void shuffle() => setState(() {
        items.shuffle();
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Shuffle Todo list')),
        body: SingleChildScrollView(
          child: Column(children: [
            _buildExpandedHeaderImage(context),
            _buildSectionHeader(context),
            _buildButtonSection(context),
            _buildListItemColumn(context),
          ]),
        ),
      ),
    );
  }

  // Image
  Widget _buildExpandedHeaderImage(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: width / headerImageRatio,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(headerImageUrl),
        ),
      ),
    );
  }

  // Header after image
  Widget _buildSectionHeader(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text('Shuffling your to-dos is fun!',
          style: textTheme.headlineSmall!),
    );
  }

  // Controls
  Widget _buildButtonSection(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.add, 'ADD', add),
        _buildButtonColumn(color, Icons.shuffle, 'SHUFFLE', shuffle),
      ],
    );
  }

  Widget _buildButtonColumn(
      Color color, IconData icon, String label, VoidCallback onTap) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(icon: Icon(icon, color: color), onPressed: onTap),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  // List of TODOs
  Widget _buildListItemColumn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(),
          for (int i = 0; i < items.length; i++) ...[
            _buildListItem(context, i, items[i]),
            const Divider(),
          ],
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index, TodoItem todoItem) {
    final color = Theme.of(context).primaryColor;
    return ListTile(
      leading: Checkbox(
        value: todoItem.checked,
        onChanged: (_) => check(index),
      ),
      trailing: Wrap(
        spacing: 12, // space between two icons
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.edit, color: color),
            onPressed: () => edit(index),
          ),
          IconButton(
            icon: Icon(Icons.delete, color: color),
            onPressed: () => delete(index),
          ),
        ],
      ),
      title: Text(todoItem.text),
    );
  }
}
