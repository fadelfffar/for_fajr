import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostCardTest extends StatelessWidget {
  const PostCardTest({super.key});

  @override
  Widget build(BuildContext context) {
    final _postFetch = Supabase.instance.client.from('post_test').stream(primaryKey: ['id']);
        final supabaseFetch = Supabase.instance.client.from('post_test').select('masjid_name');

    int like_count = 0;
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
          //TODO: Increment like count
          like_count = like_count + 1;
          Supabase.instance.client
                  .from('post_test')
                  .insert({'like_number' : 5});
                  
        },
        child: Icon(Icons.add),
      ),
      body: Card(
        child: Column(
          children: [
            StreamBuilder(stream: _postFetch, builder: (context, snapshot) {
            if (!snapshot.hasData) {
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            } else if(snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
              final post = snapshot.data!;
              return ListView.builder(
                  itemCount: post.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(post[index]['like_number'.toString()]),
                    );
                  }
              );
            };
            return Text("Fetch failed");
          })
          ],
        )
      ),
    );
  }
}