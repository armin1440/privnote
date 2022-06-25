import 'dart:convert';
import 'dart:io';

import 'package:redis/redis.dart';

// import 'package:shelf/shelf.dart';
// import 'package:shelf/shelf_io.dart';
// import 'package:shelf_router/shelf_router.dart';

Future<void> main() async {
  final conn = RedisConnection();
  conn.connect('localhost', 9788).then((Command command){
    command.send_object(["SET","key","0"]).then((var response) =>
        print(response)
    );
  });

  final server = await createServer();
  print('Server started: ${server.address} port ${server.port}');
  await handleRequests(server);
}

Future<HttpServer> createServer() async {
  final address = InternetAddress.loopbackIPv4;
  const port = 4040;
  HttpServer server = await HttpServer.bind(address, port);
  server.defaultResponseHeaders.add("Access-Control-Allow-Origin", '*');
  server.defaultResponseHeaders.add("Access-Control-Allow-Credentials", true);
  server.defaultResponseHeaders.add("Access-Control-Allow-Headers",
      "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale");
  server.defaultResponseHeaders.add("Access-Control-Allow-Methods", "POST, OPTIONS");
  return server;
}

Future<void> handleRequests(HttpServer server) async {
  await for (HttpRequest request in server) {
    switch (request.method) {
      case 'GET':
        handleGet(request);
        break;
      case 'POST':
        handlePost(request);
        break;
      default:
        handleDefault(request);
    }
  }
}

var myStringStorage = 'Hello from a Dart server';

void handleGet(HttpRequest request) {
  print(request.requestedUri.path);
  request.response
    ..write(myStringStorage)
    ..close();
}

Future<void> handlePost(HttpRequest request) async {
  String body = await utf8.decoder.bind(request).join();
  print("Received : $body");

  Map<String, dynamic> json = jsonDecode(body);

  request.response
    ..write('Got it. Thanks.')
    ..close();
}

void handleDefault(HttpRequest request) {
  request.response
    ..statusCode = HttpStatus.methodNotAllowed
    ..write('Unsupported request: ${request.method}.')
    ..close();
}