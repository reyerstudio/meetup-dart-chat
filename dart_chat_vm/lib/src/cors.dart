import 'package:shelf/shelf.dart';

final Map<String, String> _headers = {'Access-Control-Allow-Origin': '*', 'Content-Type': 'text/html'};

// For OPTIONS (preflight) requests just add headers and an empty response
Response _options(Request request) =>
    (request.method == 'OPTIONS') ? new Response.ok(null, headers: _headers) : null;
Response _cors(Response response) => response.change(headers: _headers);

Middleware corsMiddleware = createMiddleware(requestHandler: _options, responseHandler: _cors);
