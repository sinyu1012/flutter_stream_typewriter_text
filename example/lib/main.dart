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
    const text =
        'ChatGPT is a powerful conversational AI developed by OpenAI, based on the GPT-3.5 architecture. It is trained on an enormous corpus of text data and is capable of generating human-like responses to a wide range of prompts. ChatGPT is able to understand and respond to natural language queries, making it an incredibly versatile tool for communication and information retrieval. Whether you need help with a complex task, want to engage in casual conversation, or simply want to learn something new, ChatGPT is here to help. Its advanced natural language processing capabilities make it one of the most advanced conversational AI tools available today.';
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
            title: const Text('Typewriter example app'),
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
