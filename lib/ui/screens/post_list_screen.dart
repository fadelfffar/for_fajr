import 'package:flutter/material.dart';
import 'package:for_fajr/ui/screens/comment_list_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _postStream = Supabase.instance.client.from('post_test').stream(primaryKey: ['id']);
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
                      return ListTile(
                        // make sure the data is available in supabase and not NULL
                        title: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => CommentListScreen(id : post[index]['post_id'])));
                            },
                            child: Text(post[index]['post_title'])),
                            // need builder on top
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            // pass data to the next screen???
                            //         builder: (context) => MovieDetail(movieList[index].id)));
                            //   },
                        leading: Text(post[index]['post_caption']),
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
      ),
    );
  }
}