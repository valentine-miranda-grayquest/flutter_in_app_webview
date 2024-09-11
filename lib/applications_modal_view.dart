import 'package:flutter/material.dart';
import 'package:flutter_inapp_webview/application_card.dart';

class ApplicationsModalView extends StatelessWidget {
  ApplicationsModalView({super.key, required this.scrollController});

  ScrollController scrollController;

  final List<String> data = [
    "All Applications",
    "Monthly Installments",
    "Auto Payment",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.maxFinite,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(14))),
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 30,
            child: ListView.builder(
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(),
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      data[index],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  );
                }),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  controller: scrollController,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: ApplicationCard(),
                    );
                  }))
        ],
      ),
    );
  }
}
