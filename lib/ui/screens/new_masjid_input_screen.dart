import 'package:flutter/material.dart';
import 'package:for_fajr/core/database/masjid_model.dart';
import 'package:for_fajr/ui/ui_widgets/primary_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NewMasjidInputScreen extends StatefulWidget {
  const NewMasjidInputScreen({super.key});

  @override
  State<NewMasjidInputScreen> createState() => _NewMasjidInputScreenState();
}

class _NewMasjidInputScreenState extends State<NewMasjidInputScreen> {

  // MasjidModel that specifies Supabase Data
  late MasjidModel data;

  @override
  void initState() {
    //data model initialization as required by compiler
    super.initState();
    data = MasjidModel(
      masjidName: "Masjid Name", masjidLatitude: "0", masjidLongitude: "0", masjidCity: "City");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/masjid-list');
      } , child: Icon(Icons.arrow_back_ios_new)),
      body: Container(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            SizedBox(height: 80,),
            Form(
              child: Column(
                children: [
                  Text("Add New Masjid"),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Masjid Name'),
                    onChanged: (value) {
                      data.masjidName = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'City'),
                    onChanged: (value) {
                      data.masjidCity = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Latitude'),
                    onChanged: (value) {
                      data.masjidLatitude = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Longitude'),
                    onChanged: (value) {
                      data.masjidLongitude = value;
                    },
                  ),
                  PrimaryButton(
                    onPressedData: () async{
                      await Supabase.instance.client
                        .from('masjid')
                        .insert({'masjid_name': data.masjidName, 'location_latitude': data.masjidLatitude, 'location_longitude': data.masjidLongitude, 'location_city': data.masjidCity});
                    }, textButtonData: 'Register')
                ],
              ),)
          ],
        ),
      ),
    );
  }
}