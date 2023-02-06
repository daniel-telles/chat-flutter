import 'package:chat_cod3r/core/models/chat_message.dart';
import 'package:chat_cod3r/core/models/services/auth/chat/chat_firebase_service%20.dart';

import '../../../chat_user.dart';

abstract class ChatService {
  Stream<List<ChatMessage>> messagesStream();
  Future<ChatMessage?> save(String text, ChatUser user);

  factory ChatService() => ChatFirebaseService();
}
