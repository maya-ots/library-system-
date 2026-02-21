import 'dart:isolate';

void isolateSearch(SendPort sendPort) {
  final port = ReceivePort();
  sendPort.send(port.sendPort);

  port.listen((msg) {
    final List<Map<String, dynamic>> books = List<Map<String, dynamic>>.from(msg["books"]);
    final String keyword = msg["keyword"];
    final SendPort? reply = msg['reply'] as SendPort?;
    final results = books.where((b) =>
      (b["title"] as String).toLowerCase().contains(keyword.toLowerCase())
    ).toList();
    if (reply != null) {
      reply.send(results);
    } else {
      sendPort.send(results);
    }
  });
}