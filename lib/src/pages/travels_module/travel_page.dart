import 'package:flutter/material.dart';
import 'package:meleva_la/src/pages/travels_module/travel_confirmation_page.dart';
import 'package:meleva_la/src/utils/navigator_utils.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';

class TravelPage extends StatefulWidget {
  final String date;
  final String from;
  final String to;
  final String driver;
  final String photo;
  final String stars;
  final String value;

  const TravelPage({
    super.key,
    required this.date,
    required this.from,
    required this.to,
    required this.driver,
    required this.photo,
    required this.stars,
    required this.value,
  });

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  bool isPageLoading = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.secondary,
      appBar: CustomAppbar(),
      body: SafeArea(
        child:
        isPageLoading
          ? Center(child: CircularProgressIndicator())
          :
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informações sobre a viagem',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.tertiary,
                ),
              ),
              const SizedBox(height: 40.0),
              Text(
                widget.date,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.tertiary,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        color: theme.colorScheme.tertiaryFixed,
                      ),
                      Container(
                        width: 2,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: theme.colorScheme.tertiaryFixed,
                        ),
                      ),
                      Icon(
                        Icons.circle_outlined,
                        color: theme.colorScheme.tertiaryFixed,
                      ),
                    ],
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.from,
                        style: TextStyle(
                          fontSize: 18,
                          color: theme.colorScheme.tertiaryFixed,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent,
                        ),
                      ),
                      Text(
                        widget.to,
                        style: TextStyle(
                          fontSize: 18,
                          color: theme.colorScheme.tertiaryFixed,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
              Row(
                children: [
                  Text(
                    'Valor da viagem',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'R\$ ${widget.value}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
              Card(
                color: theme.colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
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
                                widget.photo == "1" ? "assets/mocks/person_mock1.jpg" : "assets/mocks/person_mock2.jpg",
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
                              widget.driver,
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
                                  widget.stars,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: (){},
                            icon: Icon(
                                Icons.navigate_next_rounded,
                                color: Colors.white,
                                size: 30,
                            ))
                      ],
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
        child: CustomButton(
          onPressed: () {
            setState(() {
              isPageLoading = true;
            });
            Navigator.of(context).push(NavigatorUtils.createSlidePageRoute(TravelConfirmationPage(
                driver: widget.driver,
                photo: widget.photo,
                stars: widget.stars)));
            setState(() {
              isPageLoading = false;
            });
          },
          title: 'Solicitar',
        ),
      ),
    );
  }
}
