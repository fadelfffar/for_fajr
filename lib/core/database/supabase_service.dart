import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  // Get a reference your Supabase client
  final supabase = Supabase.instance.client;

  Future<void> insertData() async {
    try {
      supabase
          .from('masjid')
          .insert({'masjid_name': 'Al-Ikhlas'});
    } catch (e) {
      debugPrint("insert data failed");
    }
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await supabase
        .from('masjid')
        .select('masjid_name');
    return response;
    debugPrint("fetch data success");
  }
}