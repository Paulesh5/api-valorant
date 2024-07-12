import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://valorant-api.com";

  Future<List<String>> fetchAgentPortraits() async {
    final response = await http.get(Uri.parse('$baseUrl/v1/agents'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List agents = data['data'];
      List<String> portraits = [];

      for (var agent in agents) {
        if (agent['fullPortraitV2'] != null) {
          portraits.add(agent['fullPortraitV2']);
        }
      }

      return portraits;
    } else {
      throw Exception('Failed to load agents');
    }
  }
}
