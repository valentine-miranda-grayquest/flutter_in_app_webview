import 'package:flutter/material.dart';
import 'package:flutter_inapp_webview/GQButton.dart';

class ModalPresentationScreen extends StatelessWidget {
  const ModalPresentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(12), topEnd: Radius.circular(12))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg",
                  height: 64,
                  width: 64,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 12),
                child: Text(
                  "Have a Referral Code?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 12),
                child: Text(
                  "If you are referred by one of our partners, enter the code here (Optional)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextFormField(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 16, top: 32),
                child: GQbutton(title: "PROCEED", action: () {}),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                child: GQbutton(
                    title: "SKIP",
                    action: () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
