import 'package:chat_cod3r/core/models/services/notification/chat_notification_service.dart';
import 'package:chat_cod3r/pages/auth_page.dart';
import 'package:chat_cod3r/pages/chat_page.dart';
import 'package:chat_cod3r/pages/loading_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/models/chat_user.dart';
import '../core/models/services/auth/auth_service.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({super.key});

  Future<void> init(BuildContext context) async {
    await Firebase.initializeApp();
    // ignore: use_build_context_synchronously
    await Provider.of<ChatNotificationService>(
      context,
      listen: false,
    ).init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: init(context),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          } else {
            return StreamBuilder<ChatUser?>(
              stream: AuthService().userChanges,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingPage();
                } else {
                  return snapshot.hasData ? const ChatPage() : const AuthPage();
                }
              },
            );
          }
        });
  }
}
