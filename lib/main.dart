import 'package:dynamic_bottom_sheet/controller.dart';
import 'package:dynamic_bottom_sheet/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic bottom sheet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RootWidget(),
    );
  }
}

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  bool isPageOpen = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isPageOpen) {
          panelController.close();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dynamic Bottom sheets"),
        ),
        body: SlidingUpPanel(
          controller: panelController,
          backdropColor: Colors.black.withOpacity(.2),
          backdropEnabled: false,
          backdropTapClosesPanel: true,
          isDraggable: false,
          minHeight: 0,
          maxHeight: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          borderRadius: BorderRadius.circular(15),
          collapsed: const SizedBox.shrink(),
          body: const SignIn(),
          panel: StreamBuilder<Widget?>(
            stream: pageController.stream,
            builder: (context, snapshot) {
              if (snapshot.data == null) return const SizedBox.shrink();
              return snapshot.data!;
            },
          ),
          onPanelOpened: () {
            setState(() {
              isPageOpen = true;
            });
          },
          onPanelClosed: () {
            setState(() {
              isPageOpen = false;
            });
            pageController.sink.add(null);
          },
        ),
      ),
    );
  }
}
