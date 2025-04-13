import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MasjidListScreen extends StatelessWidget {
  const MasjidListScreen({super.key});

  //TODO: Make Input Screen for obtaining Masjid location and Event by user
  //TODO: Decide between passing Input data to Google Form(or else) or directly to Supabase(immediately shows on public data)
  // and add a second validation or moderator for checking the data
  @override
  Widget build(BuildContext context) {
    final _masjidStream = Supabase.instance.client.from('masjid').stream(primaryKey: ['id']);
    final supabaseFetch = Supabase.instance.client.from('masjid').select('masjid_name');
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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: const Text("add"),
                    children: [
                      // TODO: make InputForm UI more appealing
                      TextFormField(
                        onFieldSubmitted: (value) async {
                          await Supabase.instance.client
                            .from('masjid')
                            .insert({'masjid_name': value});
                        },
                      ),
                    ]
                  );
                }
            );
          }
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
          stream: _masjidStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            } else if(snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
              final masjid = snapshot.data!;
              return ListView.builder(
                  itemCount: masjid.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(masjid[index]['masjid_name']),
                    );
                  }
              );
            };
            return Text("Fetch failed");
          }),
    );
  }
}