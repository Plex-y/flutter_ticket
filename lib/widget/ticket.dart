import 'package:flutter/material.dart';

class Ticket extends StatelessWidget {
  Ticket({required this.child});

  double ticketSize = 250;
  Color col = Colors.amber.shade200;
  Divider div = const Divider();
  bool backGroundImage = true;
  String topBackgroundImage = 'lines.png';
  Widget child;

  //TODO: el contenido del container debe poder pasarse

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: ticketSize,
          width: (ticketSize * 0.25) + ticketSize,
          decoration: BoxDecoration(
            image: backGroundImage
                ? DecorationImage(
                    image: AssetImage(topBackgroundImage), fit: BoxFit.cover)
                : null,
            color: col,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          ),
          //content top
          child: child,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: ArcClipper(),
              child: Container(
                height: 50,
                width: 50,
                color: col,
              ),
            ),
            Container(
              height: 50,
              width: (ticketSize + (ticketSize * 0.25)) - 100,
              color: col,
              child: div,
            ),
            RotatedBox(
              quarterTurns: 2,
              child: ClipPath(
                clipper: ArcClipperR(),
                child: Container(
                  height: 50,
                  width: 50,
                  color: col,
                ),
              ),
            )
          ],
        ),
        Container(
          height: ticketSize,
          width: (ticketSize * 0.25) + ticketSize,
          decoration: BoxDecoration(
            image: backGroundImage
                ? DecorationImage(
                    image: AssetImage(topBackgroundImage), fit: BoxFit.cover)
                : null,
            color: col,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
        )
      ],
    );
  }
}

//concave shape in the middle

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //Arranca desde la punta topLeft
    Path path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * .0, size.height);
    //concave deepness, side (middle curved or at the sides), side deepness, curve start point
    path.quadraticBezierTo(
        size.width * .5, size.height * .5, size.width * .0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => false;
}

class ArcClipperR extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //Arranca desde la punta topLeft
    Path path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * .0, size.height);
    //concave deepness, side (middle curved or at the sides), side deepness, curve start point
    path.quadraticBezierTo(
        size.width * .5, size.height * .5, size.width * .0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => false;
}
