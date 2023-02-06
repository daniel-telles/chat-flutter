import 'dart:async';
import 'dart:core';
import 'dart:math';

import 'package:chat_cod3r/core/models/services/auth/chat/chat_service.dart';

import '../../../chat_message.dart';
import '../../../chat_user.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [];
  static MultiStreamController<List<ChatMessage>>? _controller;

  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      Random().nextDouble().toString(),
      text,
      DateTime.now(),
      user.id,
      user.name,
      user.imageURL,
    );

    _msgs.add(newMessage);
    _controller?.add(_msgs.reversed.toList());
    return newMessage;
  }
}
