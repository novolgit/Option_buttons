import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Options',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Options"),
      ),
      body: Option(),
    );
  }
}

class Option extends StatefulWidget {
  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  int currentSelectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Stack(children: [
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: option_items.length,
          itemBuilder: (context, index) {
            return OptionBuilder(
              index: index,
              isSelected: currentSelectedIndex == index,
              onSelect: () {
                setState(() {
                  currentSelectedIndex = index;
                });
              },
            );
          },
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentSelectedIndex = null;
                });
              },
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                    color: Colors.red),
                child: Center(child: Text("Сброс")),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class OptionBuilder extends StatefulWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onSelect;

  const OptionBuilder({
    Key key,
    @required this.index,
    @required this.isSelected,
    @required this.onSelect,
  })  : assert(index != null),
        assert(isSelected != null),
        assert(onSelect != null),
        super(key: key);

  @override
  _OptionBuilderState createState() => _OptionBuilderState();
}

class _OptionBuilderState extends State<OptionBuilder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelect,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black, width: widget.isSelected ? 3 : 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text("Опция ${widget.index + 1}")),
        ),
      ),
    );
  }
}

class OptionItem {
  final String item_title;

  OptionItem({this.item_title});
}

List<OptionItem> option_items = [
  OptionItem(item_title: "Опция 1"),
  OptionItem(item_title: "Опция 2"),
  OptionItem(item_title: "Опция 3"),
  OptionItem(item_title: "Опция 4"),
  OptionItem(item_title: "Опция 5"),
  OptionItem(item_title: "Опция 6"),
  OptionItem(item_title: "Опция 7"),
  OptionItem(item_title: "Опция 8"),
  OptionItem(item_title: "Опция 9"),
  OptionItem(item_title: "Опция 10"),
];
