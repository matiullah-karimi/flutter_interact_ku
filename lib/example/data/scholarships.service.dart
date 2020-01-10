import 'dart:convert';

import 'package:flutter_interact_ku/example/data/scholarship.dart';
import 'package:http/http.dart' as http;

class ScholarshipsService {
  static String url = "https://www.jobs.af/api/v2.1/scholarship";

  /// Get single scholarship
  static Future<Scholarship> get(String slug) async {
    var client = http.Client();
    try {
      var response = await client.get('$url/$slug/details');
      return Scholarship.fromJson(jsonDecode(response.body));
    } catch (error) {
      throw error;
    } finally {
      client.close();
    }
  }

  /// List of scholarships
  static Future<List<Scholarship>> list() async {
    var client = http.Client();
    try {
      var response = await client.get('$url/findScholarship');
      List<Scholarship> scholarships = (jsonDecode(response.body) as List).map((s) => Scholarship.fromJson(s)).toList();

      return scholarships;
    } catch (error) {
      throw error;
    } finally {
      client.close();
    }
  }
}
