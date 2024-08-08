import 'package:flutter/material.dart';

class SilverWidgets extends StatelessWidget {
  const SilverWidgets({super.key});

  List<Widget> _getList() {
    List<Widget> list = List.empty(growable: true);

    for (int i = 0; i <= 20; i++) {
      list.add(Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          "Item $i",
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text("Example"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.indigo,
          toolbarHeight: 60,
        ),
        SliverList(delegate: SliverChildListDelegate(_getList())),
      ],
    );
  }
}
