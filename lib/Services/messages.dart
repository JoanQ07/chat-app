import 'package:dio/dio.dart';

final dio = Dio();

class MessageService {
  static String baseUrl = "http://localhost:3000/message";

  static Future<Response> searchChatById(String idChat) async {
    try {
      var response = await dio.get('$baseUrl/search-messages-byid',
          queryParameters: {"idChat": idChat});

      return response;
    } catch (e) {
      throw Exception('Failed to load messages: $e');
    }
  }
}
