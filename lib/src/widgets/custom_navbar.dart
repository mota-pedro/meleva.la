import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: MediaQuery.sizeOf(context).width * 0.08,
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: EdgeInsets.all(4)
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.airplane_ticket_rounded,
                    size: 34,
                    color: Colors.white,
                  ),
                  Text(
                    'Viagens',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: EdgeInsets.all(4)
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.home_rounded,
                    size: 34,
                    color: Colors.white,
                  ),
                  Text(
                    'Início',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: EdgeInsets.all(4)
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.person_rounded,
                    size: 34,
                    color: Colors.white,
                  ),
                  Text(
                    'Conta',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
