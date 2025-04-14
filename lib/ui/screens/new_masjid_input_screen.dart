import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NewMasjidInputScreen extends StatefulWidget {
  const NewMasjidInputScreen({super.key});

  @override
  State<NewMasjidInputScreen> createState() => _NewMasjidInputScreenState();
}

class _NewMasjidInputScreenState extends State<NewMasjidInputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 80,),
          Form(
            child: Column(
              children: [
                Text("Add New Masjid"),
                TextFormField(
                  decoration: InputDecoration(labelText: 'ID'),
                  initialValue: "Masjid Name",
                  onFieldSubmitted: (value) async {
                    await Supabase.instance.client
                      .from('masjid')
                      .insert({'masjid_name': value});
                  },
                ),
              ],
            ),)
        ],
      ),
    );
  }
}