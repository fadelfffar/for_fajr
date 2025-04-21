import 'package:flutter/material.dart';
import 'package:for_fajr/core/database/post_model.dart';
import 'package:for_fajr/ui/ui_widgets/primary_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// passing Input data directly Supabase(immediately shows on public data)
class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {

  // MasjidModel that specifies Supabase Data
  late PostModel data;

  @override
  void initState() {
    //data model initialization as required by compiler
    super.initState();
    data = PostModel(
      postTitle: "First Post", postCaption: "Empty Inside");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/post-list');
      } , child: Icon(Icons.arrow_back_ios_new)),
      body: Container(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            SizedBox(height: 80,),
            Form(
              child: Column(
                children: [
                  Text("Add New Post"),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Post Title'),
                    onChanged: (value) {
                      data.postTitle = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Post Caption'),
                    onChanged: (value) {
                      data.postCaption = value;
                    },
                  ),
                  PrimaryButton(
                    onPressedData: () async{
                      await Supabase.instance.client
                        .from('post_test')
                        .insert({'post_title': data.postTitle, 'post_caption': data.postCaption,});
                    }, textButtonData: 'Post')
                ],
              ),)
          ],
        ),
      ),
    );
  }
}