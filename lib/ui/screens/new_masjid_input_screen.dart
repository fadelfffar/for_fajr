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

  //TODO: add Masjid Class that specifies Supabase Data
  late MasjidModel data;

  @override
  void initState() {
    //TODO: make temporary data value to store TextForm
    super.initState();
    data = MasjidModel(
      masjidName: "Masjid Name", masjid_city: "City");
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
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Masjid Name'),
                    //TODO: change to OnChange so user don't have to Submit each time the data is changed
                    onFieldSubmitted: (value) {
                      data.masjidName = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'City'),
                    //TODO: change to OnChange so user don't have to Submit each time the data is changed
                    onFieldSubmitted: (value) {
                      data.masjid_city = value;
                    },
                  ),
                  //TODO: add a button that submit all data in one go
                  PrimaryButton(
                    onPressedData: () async{
                      await Supabase.instance.client
                        .from('masjid')
                        .insert({'masjid_name': data.masjidName, 'location_city': data.masjid_city});
                    }, textButtonData: 'Register')
                ],
              ),)
          ],
        ),
      ),
    );
  }
}