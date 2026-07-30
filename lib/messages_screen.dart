library;

import 'package:flutter/material.dart';
import 'chat.dart';
import 'chat_detail_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key, this.onBack});
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack ?? () => Navigator.of(context).maybePop(),
        ),
        title: const Text('Messages', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: sampleChats.length,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final chat = sampleChats[index];
          return ListTile(
            leading: CircleAvatar(backgroundColor: Colors.grey[300], child: Text(chat.name[0], style: const TextStyle(fontWeight: FontWeight.bold))),
            title: Text(chat.name, style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text(chat.lastMessage, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
            trailing: Text(chat.timestamp, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChatDetailScreen(chat: chat))),
          );
        },
      ),
    );
  }
}
