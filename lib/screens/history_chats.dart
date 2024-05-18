import 'package:chat_app/interfaces/history_chat.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:html' as html;

List<HChatModel>? chatsList = [];
final dio = Dio();

const String url = "http://localhost:3000/chat/search-chat-byid";

class ChatsHistory extends StatefulWidget {
  const ChatsHistory({super.key});

  @override
  State<ChatsHistory> createState() => _ChatsHistoryState();
}

class _ChatsHistoryState extends State<ChatsHistory> {
  @override
  void initState() {
    super.initState();

    searchChatById(html.window.localStorage['id_user']!);
  }

  Future<void> searchChatById(String idUser) async {
    final response = await dio.get(url, queryParameters: {"idUser": idUser});
    chatsList = ResHChat.fromJson(response.data).data;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatsList?.length,
      itemBuilder: (context, index) {
        HChatModel chatCurrent = chatsList![index];

        void onPressed() {
          Navigator.pushNamed(context, "/chat",
              arguments: {'idChat': chatCurrent.id});
        }

        return TextButton(
          onPressed: onPressed,
          child: Card(
            elevation: 10,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chatCurrent.idsUsers?[1].name ?? "Sin autor",
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      chatCurrent.lastMsg?.text ?? "Sin mesajes",
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
