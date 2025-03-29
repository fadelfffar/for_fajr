import 'package:flutter/material.dart';
import 'package:for_fajr/ui/ui_widgets/post_card.dart';

class MasjidDetailScreen extends StatelessWidget {
  const MasjidDetailScreen({super.key});

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
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(height: 40,),
            Center(
              child: Text(
              "Masjid Name: Masjid Al-Islam",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            PostCard(textMasjidName: "Test Post Name", textMasjidLocation: "TestPostLocation"),
            Text("Location:", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            Text("Masjid Al-Islam, Palestine", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20,),
            Text("Contact Information", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            Text("Phone: 0123456789", style: TextStyle(fontSize: 20)),
            Text("Email: 123@example.com", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20,),
            Text("Opening Hours", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            Text("Monday - Friday: 9 AM - 6 PM", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20,),
            Text("About Masjid Al-Islam", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            Text(
              "Masjid Al-Islam is a holy place in Palestine. It is a place of worship and prayer.",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20,),
            Text("This week Mosque's Study Event", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            Text("Date: 2022-02-14", style: TextStyle(fontSize: 20)),
            Text("Time: 10 AM", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}