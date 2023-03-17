import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typewriter_text/typewriter_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Stream<String> _getTextStream() async* {
    // 这里可以根据需求自定义文本内容，这里使用固定的文本
    const text = 'Hello, World!';
    for (int i = 0; i < text.length; i++) {
      await Future.delayed(const Duration(milliseconds: 200)); // 延迟200毫秒发送下一个字符
      yield text.substring(i, i + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    var text = "";
    final controller = TextEditingController();
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: StreamBuilder(
              stream: _getTextStream(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                print(
                    "状态：${snapshot.connectionState == ConnectionState.done} $text 新文字：${snapshot.data ?? ""}");
                final oldText = text;
                text += snapshot.data ?? "";
                controller.text = text;
                return Container(
                  constraints: const BoxConstraints(minHeight: 50),
                  child: TypewriterText(
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    controller: controller,
                    textIsFinished:
                        snapshot.connectionState == ConnectionState.done,
                  ),
                );
              },
            ),
          )),
    );
  }
}
