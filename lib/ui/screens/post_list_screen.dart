import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(): is comments used or not
    List<dynamic> comments = [];
    final _postStream = Supabase.instance.client.from('post_test').stream(primaryKey: ['id']);
    // Select
    final _commentStreamCount = Supabase.instance.client.rpc('retrieve_comment');
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
        //   preferredSize: const Size.fromHeight-(10),
        //   child: Text("Post List Screen"),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/new-post');
          }, child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
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
                        Text("Explore"),
                        Container(
                          padding: EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 16),
                          color: Colors.lightGreen,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post[index]['post_title']),
                              SizedBox(height: 8),
                              Text(post[index]['post_caption']),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Icon(Icons.comment_rounded),
                                  SizedBox(width: 4),
                                  Text(like_number.toString()),
                                  SizedBox(width: 12),
                                  //TODO: Make this a IconButton
                                  Icon(Icons.thumb_up_sharp),
                                  SizedBox(width: 4),
                                  Text("Not a button, yet"),
                                  SizedBox(width: 12),
                                  Icon(Icons.share),
                                  Text("Not a button, yet"),
                          ],
                        ),
                            ],
                          ),
                        ),
                        // TODO(): add line between
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Text("Comments (comment_count)"),
                            SizedBox(width: 80,),
                            Icon(Icons.archive_rounded)
                          ],
                        ),
                        SizedBox(height: 8,),
                        // TODO(): add line between
                    //     Container(
                    //     // padding: EdgeInsets.all(24),
                    //     child: FutureBuilder(
                    //       future: _commentStreamCount,
                    //       builder: (context, snapshot) {
                    //       if (!snapshot.hasData) {
                    //         // By default, show a loading spinner.
                    //         return const CircularProgressIndicator();
                    //       } else if(snapshot.hasError) {
                    //         return Text('${snapshot.error}');
                    //       } else if (snapshot.hasData) {
                    //         final comment = snapshot.data!;
                    //         return ListView.builder(
                    //           itemCount: comment.length,
                    //           itemBuilder: (context, index) {
                    //             // TODO(): Figure out how to show different index
                    //             return Text(comment[index+1]['comment_caption']
                    //       );
                    //       }
                    //       );
                    //     }
                    //     return Text("Error");
                    //   },
                    // ),),
                    ],
                  );}
                );
              };
              return Text("Fetch failed");
            }),
      ),
    );
  }
}