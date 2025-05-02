import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _postStream = Supabase.instance.client.from('post_test').stream(primaryKey: ['id']);
    final _commentStream = Supabase.instance.client.from('comment_list').select('comment_caption');    
    // TODO(): investigate why there is a back button on almost every appbar
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
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(10),
        //   child: Text("Post List Screen"),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/new-post');
          }, child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: StreamBuilder<List<Map<String, dynamic>>>(
            stream: _postStream,
            builder: (context, snapshot) {
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
                    final int like_number = snapshot.data![index]['like_number'];
                    return Column(
                      children: [
                        Card(
                          color: Colors.lightGreen,
                          borderOnForeground: true,
                          elevation: 8,
                          child: ListTile(
                            title: Text(post[index]['post_title']),
                            trailing:  Text(post[index]['post_caption']),
                            subtitle: Row(
                          children: [
                            Icon(Icons.comment_rounded),
                            Text(like_number.toString()),
                            Icon(Icons.thumb_up_sharp)
                          ],
                        ),
                          ),
                        ),
                        Container(
                        padding: EdgeInsets.all(24),
                        child: FutureBuilder(
                          future: _commentStream,
                          builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            // By default, show a loading spinner.
                            return const CircularProgressIndicator();
                          } else if(snapshot.hasError) {
                            return Text('${snapshot.error}');
                          } else if (snapshot.hasData) {
                            final comment = snapshot.data!;
                            return Card(
                          color: Colors.lightGreen,
                          borderOnForeground: true,
                          elevation: 8,
                          child: ListTile(
                            title: Text("Comment Title (need data)"),
                            trailing:  Text(comment[index]['comment_caption']),
                            subtitle: Row(
                          children: [
                            Icon(Icons.comment_rounded),
                            Text(like_number.toString()),
                            Icon(Icons.thumb_up_sharp)
                          ],
                        ),
                          ),
                        );
                          }
                          return Text("Fetch Failed");
                          }
                        ),
                    )],
                  );}
                );
              };
              return Text("Fetch failed");
            }),
      ),
    );
  }
}