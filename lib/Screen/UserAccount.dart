import 'package:flutter/material.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
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
                    height: MediaQuery.of(context).size.height * 0.259,
                    width: double.infinity,
                    child: ClipPath(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        color: Colors.blue,
                      ),
                      clipper: CustomClipPath(),
                    )),
                Positioned(
                    top: 50.0,
                    right: width * 0.368,
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 65,
                        backgroundImage: AssetImage('assets/images/img6.jpg'))),
                Positioned(
                    top: height * 0.3,
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 45, vertical: 0),
                        height: height,
                        width: width,
                        child: Column(
                          children: [
                            _textInputField(),
                            _sizedBox(),
                            _textInputField(),
                            _sizedBox(),
                            _rowText(),
                            _sizedBox(),
                          ],
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textInputField() {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  Widget _rowText() {
    return Container(
      color: Colors.amber,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text('FIRST NAME'),
          _sizedBox(),
          Expanded(child: TextField()),
        ],
      ),
    );
  }

  Widget _sizedBox() {
    return SizedBox(
      height: 15,
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
