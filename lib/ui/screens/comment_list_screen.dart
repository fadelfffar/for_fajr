import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommentListScreen extends StatelessWidget {
  const CommentListScreen({super.key, required this.id});
  
  final int id;

  @override
  Widget build(BuildContext context) {
    final _commentStream = Supabase.instance.client.from('comment_list').select('comment_caption');
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
      body: 
            // TODO: Add Padding on parent and style
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
                  return ListView.builder(
                      itemCount: comment.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          // make sure the data is available in supabase and not NULL
                          title: Text("test"), 
                          leading: Text(comment[index]['comment_caption']),
                        );
                      }
                  );
                };
                return Text("Fetch failed");
              }),
            )
    );
  }
}