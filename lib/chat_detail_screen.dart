library;

import 'package:flutter/material.dart';
import 'chat.dart';
import 'message.dart';

final Map<String, List<Message>> sampleMessages = {
  'Alex Rivet': [
    Message(text: 'Hey! Are you free this weekend for a hike?', timestamp: DateTime(2024, 6, 15, 9, 30)),
    Message(text: 'I\'d love to! What trail were you thinking?', timestamp: DateTime(2024, 6, 15, 9, 32), isSent: true),
    Message(text: 'The view from the summit is insane!', timestamp: DateTime(2024, 6, 15, 9, 35)),
    Message(text: 'That sounds amazing! Count me in.', timestamp: DateTime(2024, 6, 15, 9, 40), isSent: true),
  ],
  'Sarah Jenkins': [
    Message(text: 'I sent over the itinerary for Tokyo.', timestamp: DateTime(2024, 6, 15, 10, 0)),
    Message(text: 'Great, let me take a look!', timestamp: DateTime(2024, 6, 15, 10, 5), isSent: true),
    Message(text: 'Let me know if the hotel works for you.', timestamp: DateTime(2024, 6, 15, 10, 10)),
  ],
  'Leo Torres': [
    Message(text: 'Did you see the price drop for the Paris flight?', timestamp: DateTime(2024, 6, 15, 11, 0)),
    Message(text: 'No way! How much is it now?', timestamp: DateTime(2024, 6, 15, 11, 2), isSent: true),
    Message(text: 'We need to book now! It\'s only \$450 round trip.', timestamp: DateTime(2024, 6, 15, 11, 5)),
    Message(text: 'That\'s a steal! Let me check my dates.', timestamp: DateTime(2024, 6, 15, 11, 8), isSent: true),
  ],
  'EuroTrip 2024': [
    Message(text: 'Who is handling the Eurail passes?', timestamp: DateTime(2024, 6, 14, 20, 0), senderName: 'Marco'),
    Message(text: 'I can take care of that.', timestamp: DateTime(2024, 6, 14, 20, 5), isSent: true),
  ],
  'Chloe Chen': [
    Message(text: 'That cafe we found in Hanoi was the best part of the trip.', timestamp: DateTime(2024, 3, 12, 14, 0)),
    Message(text: 'Absolutely! The egg coffee was incredible.', timestamp: DateTime(2024, 3, 12, 14, 5), isSent: true),
  ],
  'WanderWise Support': [
    Message(text: 'Your refund for the canceled flight to Bali has been processed.', timestamp: DateTime(2024, 3, 10, 9, 0)),
    Message(text: 'Thank you for the update!', timestamp: DateTime(2024, 3, 10, 9, 15), isSent: true),
  ],
};

List<Message> getOrCreateMessages(String chatName) {
  if (sampleMessages.containsKey(chatName)) {
    return List.from(sampleMessages[chatName]!);
  }
  return [
    Message(text: 'Hi! I\'d love to explore the city with you.', timestamp: DateTime.now(), senderName: chatName),
  ];
}

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key, required this.chat});
  final Chat chat;

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  late List<Message> _messages;
  final _textController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _messages = getOrCreateMessages(widget.chat.name);
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(
        Message(text: text, timestamp: DateTime.now(), isSent: true),
      );
    });
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.chat.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (_, i) {
                final msg = _messages[i];
                return Align(
                  alignment: msg.isSent
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: msg.isSent
                          ? const Color(0xFF1976D2)
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      msg.text,
                      style: TextStyle(
                        color: msg.isSent ? Colors.white : Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.grey[100],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF1976D2)),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
