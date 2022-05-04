import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);

  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(32),
        bottomRight: Radius.circular(32),
      ),
      child: SizedBox(
        width: screenWidth * 0.7,
        child: Drawer(
          backgroundColor: Colors.white,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.centerRight,
                color: Colors.white,
                child: Container(
                  color: Colors.lightBlueAccent,
                  child: ClipPath(
                    clipper: Wave(),
                    child: Container(
                      height: 120,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 25,
                  width: 5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 70,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          margin: const EdgeInsets.only(
                            bottom: 50,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: Colors.black54,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    listItem(Icons.mail, "All Mail", Colors.lightBlueAccent),
                    listItem(Icons.label_important, "Important", Colors.red),
                    listItem(Icons.people, "Social", Colors.green),
                    listItem(Icons.discount, "Promotions", Colors.orange),
                    listItem(Icons.favorite, "Favorite", Colors.pink),
                    listItem(Icons.drafts, "Drafts", Colors.deepPurple),
                    listItem(Icons.delete, "Trash", Colors.grey),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listItem(IconData icon, String label, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color,
            ),
            child: Center(
              child: Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 12,),
          Text(
            label,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

}

class Wave extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(size.width, 0);

    var point1 = Offset(size.width, size.height * 0.2);
    var point2 = Offset(size.width - 18, size.height * 0.35);

    path.quadraticBezierTo(point1.dx, point1.dy, point2.dx, point2.dy);

    var point3 = Offset(size.width - 35, size.height * 0.5);
    var point4 = Offset(size.width - 18, size.height * 0.65);

    path.quadraticBezierTo(point3.dx, point3.dy, point4.dx, point4.dy);

    var point5 = Offset(size.width, size.height * 0.8);
    var point6 = Offset(size.width, size.height);

    path.quadraticBezierTo(point5.dx, point5.dy, point6.dx, point6.dy);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
