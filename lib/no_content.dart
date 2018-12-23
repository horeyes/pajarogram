import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoContent extends StatelessWidget {
  const NoContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/undraw_a_day_at_the_park_owg1.svg',
            height: 100.0,

          ),
          const Text("There's no bird on the hood",
              style: TextStyle(fontSize: 16.0),
              softWrap: true,
          )
        ],
      ),
    );
  }
}
