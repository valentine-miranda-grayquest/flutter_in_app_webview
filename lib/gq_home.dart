import 'package:flutter/material.dart';
import 'package:flutter_inapp_webview/applications_modal_view.dart';
import 'package:flutter_inapp_webview/installement_card.dart';

class GQHome extends StatefulWidget {
  const GQHome({super.key});

  @override
  State<StatefulWidget> createState() => _GQHomeState();
}

class _GQHomeState extends State<GQHome> {
  double itemExtent = 225;

  final _scrollController = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: NavigationBar(
          height: 50,
          onDestinationSelected: (value) {
            print(value);
          },
          destinations: const [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Icon(Icons.home), Text("Home")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Icon(Icons.menu), Text("Menu")],
            ),
          ]),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Row(children: [
          Text(
            "grayQuest",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 230,
            color: Colors.indigo,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List<Widget>.generate(10, (int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    child: InstallementCarousel(
                      width: 225,
                    ),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: DraggableScrollableSheet(
                initialChildSize: 1,
                maxChildSize: 1,
                minChildSize: 1,
                expand: true,
                snap: true,
                controller: _scrollController,
                builder: (context, controller) {
                  return ApplicationsModalView();
                }),
          )
        ],
      ),
    ));
  }
}
