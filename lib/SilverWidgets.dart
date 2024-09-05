import 'package:flutter/material.dart';
import 'package:flutter_inapp_webview/modal_presentation_screen.dart';

class SilverWidgets extends StatelessWidget {
  const SilverWidgets({super.key});

  List<Widget> _getList(BuildContext context) {
    List<Widget> list = List.empty(growable: true);

    for (int i = 0; i <= 20; i++) {
      list.add(Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () {
            print("Tapped $i");
            showModalBottomSheet(
                context: context,
                useSafeArea: true,
                constraints: const BoxConstraints(maxHeight: 430),
                builder: (BuildContext build) {
                  return const ModalPresentationScreen();
                });
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              color: Colors.amberAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Item $i",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        const SliverAppBar(
          title: Text("Example"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.indigo,
          toolbarHeight: 60,
        ),
        SliverList(
          delegate: SliverChildListDelegate(_getList(context)),
        ),
      ],
    );
  }
}
