import 'package:flutter/material.dart';

class ApplicationsModalView extends StatelessWidget {
  ApplicationsModalView({super.key});

  final List<String> data = [
    "One one",
    "Two",
    "Three",
    "Fourty Four",
    "Five",
    "Six",
    "Seventy Eight",
    "Eight",
    "Nine",
    "Thousand"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.maxFinite,
      color: Colors.amber,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text(data[index]),
                  );
                }),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        color: Colors.indigo,
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          "$index",
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
