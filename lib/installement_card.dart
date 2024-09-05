import 'package:flutter/material.dart';

class InstallementCarousel extends StatelessWidget {
  InstallementCarousel({super.key, required this.width});

  double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg",
                height: 64,
                width: 64,
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amber[100]),
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                child: const Text(
                  "Auto Debit",
                  style: TextStyle(color: Colors.amber),
                ),
              ),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Valentine Miranda",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text("Application Code: GQAD52"),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Next Debit"),
              Text(
                "07/12/2023",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Installments"),
                  Spacer(),
                  Text("03/04"),
                ],
              ),
              LinearProgressIndicator(
                value: 70 / 100,
                color: Colors.indigo.shade400,
              )
            ],
          )
        ],
      ),
    );
  }
}
