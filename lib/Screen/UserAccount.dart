import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shopy_firebase/widgets/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  File imageFile;

  pickImageFromGallery(ImageSource source) {
    ImagePicker.pickImage(source: source).then((imgFile) async {
      File cropped = await ImageCropper.cropImage(
          sourcePath: imgFile.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          androidUiSettings: AndroidUiSettings(
              toolbarColor: Colors.deepOrange,
              toolbarTitle: "Cropping",
              statusBarColor: Colors.deepOrange.shade900,
              backgroundColor: Colors.white));
      setState(() {
        try {
          if (cropped != null) {
            imageFile = cropped;
          }
        } catch (e) {}
        Navigator.pop(context);
      });
    });
  }

  void _showPickDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Pick From Gallery'),
                onTap: () {
                  pickImageFromGallery(ImageSource.gallery);
                },
              ),
              ListTile(
                title: Text('Take A Picture'),
                onTap: () {
                  pickImageFromGallery(ImageSource.camera);
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            child: Stack(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.24,
                    width: double.infinity,
                    child: ClipPath(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                            color: orangeAccent,
                            image: DecorationImage(
                                image: AssetImage('assets/images/back.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      clipper: CustomClipPath(),
                    )),
                Positioned(
                    left: 0.0,
                    child: IconButton(
                        icon: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 25,
                              color: orangeAccent,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        })),
                Positioned(
                    top: 50.0,
                    right: width * 0.368,
                    child: GestureDetector(
                      onTap: () {
                        _showPickDialogue(context);
                      },
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 65,
                          backgroundImage: imageFile == null
                              ? AssetImage('assets/images/back.jpg')
                              : FileImage(imageFile)),
                    )),
                Positioned(
                    top: height * 0.3,
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 45, vertical: 0),
                        height: height,
                        width: width,
                        child: Column(
                          children: [
                            _sizedBox(),
                            _rowText('FIRST NAME', 30),
                            _contianerLine(width),
                            _sizedBox(),
                            _rowText('LAST NAME', 33),
                            _contianerLine(width),
                            _sizedBox(),
                            _rowText('BIRTHDAY', 45),
                            _contianerLine(width),
                            _sizedBox(),
                            _rowText('GENDER', 62),
                            _contianerLine(width),
                            _sizedBox(),
                            _rowText('E-MAIL', 68),
                            _contianerLine(width),
                            _sizedBox(),
                            _rowText('LOCATION', 39),
                            _contianerLine(width),
                            _sizedBox(),
                            _updateProfile()
                          ],
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _rowText(String text, double sizedBoxwidth) {
    return Container(
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          SizedBox(
            width: sizedBoxwidth,
          ),
          Expanded(
            child: (text == 'GENDER' || text == 'E-MAIL' || text == 'BIRTHDAY')
                ? TextField(
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                        enabled: false, border: InputBorder.none),
                  )
                : TextField(
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
          )
        ],
      ),
    );
  }

  Widget _sizedBox() {
    return SizedBox(
      height: 15,
    );
  }

  Widget _contianerLine(double width) {
    return Container(
      width: width,
      height: 1,
      color: Colors.grey,
    );
  }

  Widget _updateProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: orangeAccent,
          onPressed: () {},
          child: Text(
            'UPDATE',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
