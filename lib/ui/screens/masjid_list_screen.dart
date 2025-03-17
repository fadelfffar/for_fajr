import 'package:flutter/material.dart';
import 'package:for_fajr/ui/ui_widgets/masjid_card.dart';

class MasjidListScreen extends StatelessWidget {
  const MasjidListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        // add Border with shape
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))
        ),
        // define upper appbar height
        toolbarHeight: 40,
        // PreferrezSize make a new widget under appBar by extending it
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(24),
          child: Text("Masjid List Screen"),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 18, right:18),
        child: ListView(
          children: [
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/masjid-detail');
            }, child:
              MasjidCard(textMasjidName: "Al-Istiqomah", textMasjidLocation: "Bojanegara, Purbalingga", textMasjidEvent: "Kultum Subuh",),
            ),
            SizedBox(height: 18,),
            MasjidCard(textMasjidName: "Al-Ikhlas", textMasjidLocation: "Karangsentul, Purbalingga", textMasjidEvent: "Kultum Subuh"),
            SizedBox(height: 18,),
            MasjidCard(textMasjidName: "Al-Ikhlas", textMasjidLocation: "Karangsentul, Purbalingga", textMasjidEvent: "Kultum Subuh"),
            SizedBox(height: 18,),
            MasjidCard(textMasjidName: "Al-Ikhlas", textMasjidLocation: "Karangsentul, Purbalingga", textMasjidEvent: "Kultum Subuh"),
            SizedBox(height: 18,),
            MasjidCard(textMasjidName: "Al-Ikhlas", textMasjidLocation: "Karangsentul, Purbalingga", textMasjidEvent: "Kultum Subuh"),
            SizedBox(height: 18,),
            MasjidCard(textMasjidName: "Al-Ikhlas", textMasjidLocation: "Karangsentul, Purbalingga", textMasjidEvent: "Kultum Subuh"),
            SizedBox(height: 18,),
            MasjidCard(textMasjidName: "Al-Ikhlas", textMasjidLocation: "Karangsentul, Purbalingga", textMasjidEvent: "Kultum Subuh"),
            SizedBox(height: 18,),
            MasjidCard(textMasjidName: "Al-Ikhlas", textMasjidLocation: "Karangsentul, Purbalingga", textMasjidEvent: "Kultum Subuh"),
          ],
        ),
      ),
    );
  }
}