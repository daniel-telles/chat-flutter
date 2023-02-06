import 'dart:math';

import 'package:chat_cod3r/components/messages.dart';
import 'package:chat_cod3r/components/new_message.dart';
import 'package:chat_cod3r/core/models/chat_notification.dart';
import 'package:chat_cod3r/core/models/services/auth/auth_service.dart';
import 'package:chat_cod3r/pages/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/models/services/notification/chat_notification_service.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cod3r Chat'),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Container(
                    child: Row(
                      children: const [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.black87,
                        ),
                        SizedBox(width: 10),
                        Text('Sair'),
                      ],
                    ),
                  ),
                ),
              ],
              onChanged: (value) {
                if (value == 'logout') {
                  AuthService().logout();
                }
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return const NotificationPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.notifications),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: CircleAvatar(
              maxRadius: 10,
              backgroundColor: Colors.red.shade800,
              child: Text(
                '${Provider.of<ChatNotificationService>(context).itemsCount}',
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: const [
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () {
      //     Provider.of<ChatNotificationService>(context, listen: false).add(
      //       ChatNotification(
      //           title: 'Mais uma notificação!',
      //           body: Random().nextDouble().toString()),
      //     );
      //   },
      // ),
    );
  }
}
