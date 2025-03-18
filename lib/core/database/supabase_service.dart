import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  // Get a reference your Supabase client
  
}

Future<void> insertData() async{
  try {
    final supabase = Supabase.instance.client
    .from('masjid')
    .insert({'masjid_name': 'Al-Istiqomah'});
  } catch (e) {
    debugPrint("insert data failed");
  }
}
