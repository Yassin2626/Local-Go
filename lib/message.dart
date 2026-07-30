library;

class Message {
  const Message({
    required this.text,
    required this.timestamp,
    this.isSent = false,
    this.senderName = '',
  });

  final String text;
  final DateTime timestamp;
  final bool isSent;
  final String senderName;
}
