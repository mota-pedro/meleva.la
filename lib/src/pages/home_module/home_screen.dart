import 'package:flutter/material.dart';
import 'package:meleva_la/src/widgets/custom_appbar.dart';
import 'package:meleva_la/src/widgets/custom_card.dart';
import 'package:meleva_la/src/widgets/custom_list_tile.dart';
import 'package:meleva_la/src/widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController fromDestinyController = TextEditingController();
  final TextEditingController toDestinyController = TextEditingController();
  final TextEditingController dateController = TextEditingController(text: 'Hoje');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: CustomAppbar(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                    child: Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Column(
                                children: [
                                  SizedBox(height: 30.0),
                                  SizedBox(
                                    width: 250,
                                    child: Text(
                                      'Para onde você quer ir?',
                                      style: TextStyle(
                                          fontSize: 32,
                                          color: Theme.of(context).colorScheme.primary,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0),
                            SizedBox(
                              child: Column(
                                children: [
                                  CustomTextField(
                                      controller: toDestinyController,
                                      icon: Icons.pin_drop_rounded,
                                      label: 'Para'),
                                  SizedBox(height: 60.0),
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width,
                                    child: Text(
                                      'Viagens próximas a você',
                                      style: TextStyle(
                                          fontSize: 28,
                                          color: Theme.of(context).colorScheme.primary,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  CustomCard()
                                ],
                              ),
                            )
                          ]
                      ),
                    )
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
