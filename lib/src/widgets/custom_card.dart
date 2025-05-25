import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: SizedBox(
        width: 375,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ter. 27 Mai.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      Container(
                        width: 1.5,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).colorScheme.secondary
                        ),
                      ),
                      Icon(
                        Icons.circle_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ],
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'De',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.secondary,
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
                        'Para',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.secondary,
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
                      border: Border.all(color: Theme.of(context).colorScheme.secondary)
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Theme.of(context).colorScheme.primary)
                      ),
                      child: ClipOval(
                        child: Image.asset(
                            "assets/mocks/person_mock1.jpg",
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
                        'Nome do motorista',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          SizedBox(width: 6.0),
                          Text(
                            '5,0',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.secondary,
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
    );
  }
}
