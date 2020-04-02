// Material
import 'package:flutter/material.dart';

// Consts
import 'package:covid_tracker/constants/colors.dart';

class Tile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String summary;
  final Widget pageToLoad;

  const Tile({this.title, this.icon, this.summary, this.pageToLoad});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: PurpleScheme.mainColorDark,
          borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            splashColor: PurpleScheme.mainColorAccent,
            onTap: () {
              if (pageToLoad != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pageToLoad)
                );
              }
            },
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    icon,
                    size: 32.0,
                    color: PurpleScheme.compColor,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                    )
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    summary,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
