import 'package:flutter/material.dart';
import 'package:meleva_la/src/pages/travels_module/chat_page.dart';

import '../../utils/navigator_utils.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import '../home_module/home_screen.dart';

class TravelConfirmationPage extends StatefulWidget {
  final String driver;
  final String photo;
  final String stars;

  const TravelConfirmationPage({super.key, required this.driver, required this.photo, required this.stars});

  @override
  State<TravelConfirmationPage> createState() => _TravelConfirmationPageState();
}

class _TravelConfirmationPageState extends State<TravelConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.secondary,
      appBar: CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.primary
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    'Viagem confirmada!',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Agora entre em contato com o motorista para alinhar os detalhes.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  CustomButton(
                    onPressed: () {
                      Navigator.of(context).push(NavigatorUtils.createSlidePageRoute(ChatPage(
                          driver: widget.driver,
                          photo: widget.photo,
                          stars: widget.stars)));
                    },
                    leadingIcon: Icons.chat_bubble_rounded,
                    title: 'Conversar com o motorista',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
        child: CustomButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
          },
          title: 'Voltar ao início',
        ),
      )
    );
  }
}
