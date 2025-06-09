import 'package:flutter/material.dart';
import 'package:meleva_la/src/utils/navigator_utils.dart';

class CustomCard extends StatelessWidget {
  final String date;
  final String value;
  final String from;
  final String to;
  final String driver;
  final String photo;
  final String stars;
  final Widget? navigateTo;

  const CustomCard({super.key, required this.date, required this.from, required this.to, required this.driver, required this.photo, required this.stars, this.navigateTo, required this.value});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (navigateTo != null) Navigator.of(context).push(NavigatorUtils.createSlidePageRoute(navigateTo!));
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0.0)
      ),
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    Spacer(),
                    Text(
                      'R\$ ${value}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.circle_outlined,
                          color: Colors.white,
                        ),
                        Container(
                          width: 1.5,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                          ),
                        ),
                        Icon(
                          Icons.circle_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          from,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: 1.5,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent
                          ),
                        ),
                        Text(
                          to,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 1.5,
                  width: 375,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white54
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white)
                      ),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Theme.of(context).colorScheme.primary)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                              photo == "1" ? "assets/mocks/person_mock1.jpg" : "assets/mocks/person_mock2.jpg",
                              fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          driver,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            SizedBox(width: 6.0),
                            Text(
                              stars,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
