import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_instagclone/model/post_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  File _image;

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }
  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  int pressforchange=1;


  List<Post> item= new List();
  String post1="https://firebasestorage.googleapis.com/v0/b/koreanguideway.appspot.com/o/develop%2Fpost.png?alt=media&token=f0b1ba56-4bf4-4df2-9f43-6b8665cdc964";
  String post2="https://firebasestorage.googleapis.com/v0/b/koreanguideway.appspot.com/o/develop%2Fpost2.png?alt=media&token=ac0c131a-4e9e-40c0-a75a-88e586b28b72";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    item.add(Post(postImage: post1,caption: "discover more great images on our sposor's   site"));
    item.add(Post(postImage: post2,caption: "discover more great images on our sposor's site"));
    pressforchange;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:Center(child: Text("Profile",style: TextStyle(color: Colors.black87,fontFamily: "Billabong",fontSize: 25),),),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(

          children: [
            //myphotp
            GestureDetector(
              onTap: (){
                _showPicker(context);
              },
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        border: Border.all(
                            width: 1.5,
                            color: Color.fromRGBO(193, 53, 132, 1)
                        )

                    ),
                    child: _image==null?
                    ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image(
                        image: AssetImage("assets/images/ic_person.webp"),
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    )
                        :
                    ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image(
                        image: AssetImage("$_image"),
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    )
                    // Stack(
                    //   children: [
                    //     Image.file(_image,
                    //       height: double.infinity,
                    //       width: double.infinity,
                    //       fit: BoxFit.cover,),
                    //     Container(
                    //       width: double.infinity,
                    //       color: Colors.black12,
                    //       padding: EdgeInsets.all(20),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.end,
                    //         children: [
                    //           IconButton(
                    //               icon: Icon(Icons.highlight_remove,color: Colors.white,),
                    //               onPressed: (){
                    //                 setState(() {
                    //                   _image=null;
                    //                 });
                    //
                    //               }
                    //           ),
                    //
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // )
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.add_circle,color: Colors.purple,)

                      ],
                    ),
                  )
                ],
              ),

            ),

            //myinfo
            SizedBox(height: 10,) ,
           Text("Islomjon".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
            SizedBox(height: 3,),
            Text("Rixsiyevv",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.normal),),
            //my follow &followers
            Container(
              height: 80,
              child: Row(
                children: [
                  Expanded(
                      child: Center(
                        child: Column(

                          children: [
                            Text("675".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                            SizedBox(height: 3,),
                            Text("Posts",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.normal),),
                          ],
                        ),)),
                  Container(width: 1,height: 40,
                  color: Colors.grey.withOpacity(0.5),),
                  Expanded(
                      child: Center(
                        child: Column(

                          children: [
                            Text("777".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                            SizedBox(height: 3,),
                            Text("Followers",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.normal),),
                          ],
                        ),)),
                  Center(child:Container(width: 1,height: 40,
                    color: Colors.grey.withOpacity(0.5),),),
                  Expanded(
                      child: Center(
                        child: Column(

                          children: [
                            Text("666".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                            SizedBox(height: 3,),
                            Text("Following",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.normal),),
                          ],
                        ),)),
                ],
              ),
            ),
            Container(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            pressforchange=1;
                          });
                        },
                        icon: Icon(Icons.margin),
                      ),
                    ),
                  ),
                  Container(width: 1,height: 30,color: Colors.grey,),

                  Expanded(
                    child: Center(
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            pressforchange=2;
                          });
                        },
                        icon: Icon(Icons.margin),
                      ),
                  ),
                  ),
                ],
              ),
            ),
            Expanded(child: GridView.builder(
              itemCount: item.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: pressforchange    ),
                itemBuilder: (ctx,index){
                return _listOfItem(item[index]);
                }

                ),
            ),


          ],
        ),),
    );
  }
  Widget _listOfItem(Post post){

    return Container(
      //height: MediaQuery.of(context).size.width/2,
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          CachedNetworkImage(imageUrl: post.postImage,
            width: double.infinity,
            height: MediaQuery.of(context).size.width/3,
            placeholder: (context,url)=>CircularProgressIndicator(),
            errorWidget: (ctx,url,error)=>Icon(Icons.error,color: Colors.purple,),
            fit: BoxFit.cover,


          ),
          SizedBox(height: 3,),
          Text(post.caption,style: TextStyle(color: Colors.black87.withOpacity(0.7),),maxLines: 2,)
        ],
      ),
    );
  }
}
