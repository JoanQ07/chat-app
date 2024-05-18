import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:chat_app/interfaces/chat.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:html' as html;

class ChatUser extends StatefulWidget {
  final String? idChat;

  const ChatUser({Key? key, this.idChat}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatUser> {
  final TextEditingController _messageController = TextEditingController();
  List<ChatModel> _messages = [];
  String? _idChat;

  @override
  void initState() {
    super.initState();
    _idChat = widget.idChat;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_idChat == null) {
      // Si _idChat no se ha inicializado desde el widget, intenta obtenerlo de los argumentos
      dynamic params = ModalRoute.of(context)?.settings.arguments as Map?;
      _idChat = params?["idChat"];
      print("1 $_idChat");
    }
    if (_idChat != null) {
      print("2 $_idChat");
      _loadMessages();
    }
  }

  Future<void> _loadMessages() async {
    print("_idChat -> $_idChat");
    try {
      IO.Socket socket = IO.io('http://localhost:3000');
      socket.onConnect((_) {
        print('connect');
        socket.emit('msg', 'test');
      });
      socket.on('event', (data) => print(data));
      socket.onDisconnect((_) => print('disconnect'));
      socket.on('fromServer', (_) => print(_));

      // final dio = Dio();
      // final response = await dio.get(
      //   'http://localhost:3000/message/search-messages-byid',
      //   queryParameters: {'idChat': _idChat},
      // );

      // if (response.statusCode == 200) {
      //   List<ChatModel> chatsList = ResChat.fromJson(response.data).data;
      //   setState(() {
      //     _messages = chatsList;
      //   });
      // } else {
      //   throw Exception('Failed to load messages');
      // }
    } catch (e) {
      print('Error fetching messages: $e');
    }
  }

  void _sendMessage() {
    print('_sendMessage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  subtitle: Text(_messages[index].idUser.id ==
                          html.window.localStorage['id_user']!
                      ? 'Tú - ${_messages[index].createdAt}'
                      : 'Elle - ${_messages[index].createdAt}'),
                  title: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: _messages[index].idUser.id ==
                              html.window.localStorage['id_user']!
                          ? Colors.blue[100]
                          : Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(_messages[index].text),
                  ),
                  isThreeLine: true,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Escribe un mensaje...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _sendMessage,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
