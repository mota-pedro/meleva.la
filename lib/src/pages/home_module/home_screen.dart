import 'package:flutter/material.dart';
import 'package:meleva_la/src/widgets/custom_appbar.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                    child: Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: SizedBox(
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
                            ),
                            SizedBox(height: 20),
                            Card(
                              color: Theme.of(context).colorScheme.tertiary,
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: CustomHomeTextField(controller: fromDestinyController, icon: Icons.pin_drop_rounded, label: 'De'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: CustomHomeTextField(controller: toDestinyController, icon: Icons.pin_drop_rounded, label: 'Para'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: CustomListTile(icon: Icons.calendar_month_rounded, title: dateController.text, onTap: () {}),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Container(color: Colors.grey, width: MediaQuery.sizeOf(context).width, height: 1.5),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: CustomListTile(icon: Icons.person_rounded, title: '1 pessoa', onTap: () {},),
                                  ),
                                  Center(
                                    child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          backgroundColor: Theme.of(context).colorScheme.primary,
                                          fixedSize: Size(MediaQuery.sizeOf(context).width, 70),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0), bottomRight: Radius.circular(12.0))
                                          )
                                        ),
                                        child: Text(
                                            'Procurar',
                                            style: TextStyle(
                                              color: Theme.of(context).colorScheme.secondary
                                            ),
                                        )),
                                  )
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
