import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class GQWebView extends StatefulWidget {
  const GQWebView({super.key});

  @override
  State<StatefulWidget> createState() => _GQWebViewState();
}

class _GQWebViewState extends State<GQWebView> {
  late InAppWebViewSettings settings;
  InAppWebViewController? controller;

  static InAppWebViewKeepAlive keepAlive = InAppWebViewKeepAlive();

  @override
  void initState() {
    super.initState();
    configureSettings();
  }

  void configureSettings() {
    settings = InAppWebViewSettings(
        alwaysBounceVertical: false,
        alwaysBounceHorizontal: false,
        builtInZoomControls: false,
        isInspectable: true,
        isTextInteractionEnabled: true,
        javaScriptEnabled: true,
        javaScriptCanOpenWindowsAutomatically: true,
        supportZoom: false,
        useShouldOverrideUrlLoading: true);
  }

  void configureController(InAppWebViewController? controller) {
    if (controller == null) {
      return;
    }

    PlatformInAppWebViewController.debugLoggingSettings.enabled = false;

    controller.evaluateJavascript(source: '''
      document.documentElement.style.userSelect = 'none';
      ''');

    controller.addJavaScriptHandler(
        handlerName: 'sdkSuccess',
        callback: (args) {
          print(args);
        });

    controller.addJavaScriptHandler(
        handlerName: 'sdkError',
        callback: (args) {
          print(args);
        });

    controller.addJavaScriptHandler(
        handlerName: 'sdkCancel',
        callback: (args) {
          print(args);
        });

    controller.addJavaScriptHandler(
        handlerName: 'sendPGOptions',
        callback: (args) {
          print(args);
        });

    controller.addJavaScriptHandler(
        handlerName: 'sendADOptions',
        callback: (args) {
          print(args);
        });
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialSettings: settings,
      keepAlive: _GQWebViewState.keepAlive,
      initialUrlRequest: URLRequest(
          url: WebUri('https://payments-test.cashfree.com/links/z759msvi3i4g')),
      onWebViewCreated: (controller) {
        this.controller = controller;
        configureController(controller);
      },
      shouldOverrideUrlLoading: (controller, navigationAction) async {
        print(navigationAction.request.url);
        return NavigationActionPolicy.ALLOW;
      },
      onReceivedError: (controller, request, error) {
        print(error.description);
      },
      onReceivedHttpError: (controller, request, errorResponse) {
        print(errorResponse.data);
      },
      onCreateWindow: (controller, createWindowAction) async {
        print(createWindowAction.request);
        return true;
      },
    );
  }
}
