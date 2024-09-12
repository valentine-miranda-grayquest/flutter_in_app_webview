import 'package:flutter/material.dart';
import 'package:flutter_inapp_webview/applications_modal_view.dart';
import 'package:flutter_inapp_webview/installement_card.dart';

class GQHome extends StatefulWidget {
  GQHome({super.key});

  final _scrollController = DraggableScrollableController();

  @override
  State<StatefulWidget> createState() => _GQHomeState(_scrollController);
}

class _GQHomeState extends State<GQHome> {
  _GQHomeState(this._scrollController);

  final DraggableScrollableController _scrollController;
  double _alpha = 1;
  final _minChildSize = 0.65;

  @override
  void initState() {
    super.initState();
    addAnimations();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _scrollController.removeListener(_scrollAnimations);
  }

  void addAnimations() {
    _scrollController.addListener(_scrollAnimations);
  }

  void _scrollAnimations() {
    setState(() {
      _alpha = 1 + _minChildSize - _scrollController.size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: Container(
            height: 50,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 1,
              )
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Icon(Icons.home),
                    Text("Home"),
                  ],
                ),
                Container(
                  height: 25,
                  width: 1,
                  color: Colors.grey,
                ),
                const Row(
                  children: [
                    Icon(Icons.person_2_rounded),
                    Text("Menu"),
                  ],
                )
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            title: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "grayQuest",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.info,
                    color: Colors.white,
                  )
                ]),
          ),
          floatingActionButton: GestureDetector(
            onTap: () {
              print("Did tap floating action button");
            },
            child: Container(
              height: 50,
              width: 120,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.indigo,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 2))
                  ],
                  borderRadius: BorderRadius.circular(25)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  Text(
                    "PAY FEE",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: LayoutBuilder(builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  color: Colors.indigo,
                ),
                Container(
                    height: MediaQuery.sizeOf(context).height * 0.27,
                    color: Colors.indigo,
                    child: Opacity(
                      opacity: _alpha,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 12),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List<Widget>.generate(6, (int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 3,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  print("Did tap Item");
                                },
                                child: InstallementCarousel(
                                  width: MediaQuery.sizeOf(context).width / 1.7,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    )),
                DraggableScrollableSheet(
                    initialChildSize: _minChildSize,
                    maxChildSize: 1,
                    minChildSize: _minChildSize,
                    expand: true,
                    snap: false,
                    snapAnimationDuration: const Duration(milliseconds: 150),
                    controller: _scrollController,
                    shouldCloseOnMinExtent: false,
                    builder:
                        (BuildContext context, ScrollController controller) {
                      return ApplicationsModalView(
                        scrollController: controller,
                      );
                    }),
              ],
            );
          })),
    );
  }
}
