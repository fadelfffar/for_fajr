import 'package:flutter/material.dart';
import 'package:for_fajr/ui/ui_widgets/primary_button.dart';
import 'package:native_geofence/native_geofence.dart';

class NewMasjidInputScreen extends StatefulWidget {
  const NewMasjidInputScreen({super.key});

  @override
  State<NewMasjidInputScreen> createState() => _NewMasjidInputScreenState();
}

class _NewMasjidInputScreenState extends State<NewMasjidInputScreen> {

  //TODO: add Masjid Class that specifies Supabase Data
  late /* Masjid */ data;

  @override
  void initState() {
    //TODO: make temporary data value to store TextForm
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            SizedBox(height: 80,),
            Form(
              child: Column(
                children: [
                  Text("Add New Masjid"),
                  // TextFormField(
                  //   decoration: InputDecoration(labelText: 'Masjid Name'),
                  //   onFieldSubmitted: (value) async {
                  //     await Supabase.instance.client
                  //       .from('masjid')
                  //       .insert({'masjid_name': value});
                  //   },
                  // ),
                  // TextFormField(
                  //   decoration: InputDecoration(labelText: 'City'),
                  //   onFieldSubmitted: (value) async {
                  //     await Supabase.instance.client
                  //       .from('masjid')
                  //       .insert({'location_city': value});
                  //   },
                  // ),
                  //TODO: add a button that submit all data in one go
                  PrimaryButton(
                    onPressedData: () async{
                      if (condition) {
                        
                      }
                    }, textButtonData: 'Register')
                ],
              ),)
          ],
        ),
      ),
    );
  }
}