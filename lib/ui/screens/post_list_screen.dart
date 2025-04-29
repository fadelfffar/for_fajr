import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _masjidStream = Supabase.instance.client.from('post_test').stream(primaryKey: ['id']);
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
          child: Text("Post List Screen"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/new-post');
          }, child: Icon(Icons.add),
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
                      // make sure the data is available in supabase and not NULL
                      title: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/comment-list');
                          },
                          child: Text(masjid[index]['post_title'])),
                      leading: Text(masjid[index]['post_caption']),
                      subtitle: ElevatedButton(
                        onPressed: () {
                          // TODO : asign Supabase RPC function to increment likes for corresponding post
                          // TODO (Advanced) : make new table with foreign key on PostID to save other user post to main user
                          Supabase.instance.client.rpc("increment_likes");
                        },
                        child: Icon(Icons.thumb_up_sharp)),
                    );
                  }
              );
            };
            return Text("Fetch failed");
          }),
    );
  }
}