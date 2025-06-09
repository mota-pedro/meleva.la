import 'package:flutter/material.dart';
import 'package:meleva_la/src/pages/travels_module/travel_page.dart';
import 'package:meleva_la/src/widgets/custom_appbar.dart';
import 'package:meleva_la/src/widgets/custom_card.dart';
import 'package:meleva_la/src/widgets/custom_navbar.dart';
import 'package:meleva_la/src/widgets/custom_text_field.dart';

import '../../models/user.dart';
import '../../services/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User user;

  final TextEditingController toDestinyController = TextEditingController();

  final List<Map<String, String>> ridesList = [
    {"date": "Ter. 27 Mai.", "from": "Jupi - PE", "to": "Garanhuns - PE", "driver": "João Silva", "photo": "1", "stars": "5,0", "value": "12,00"},
    {"date": "Ter. 27 Mai.", "from": "Garanhuns - PE", "to": "Lajedo - PE", "driver": "Marcelo Cabral", "photo": "2", "stars": "4,8", "value": "14,00"},
    {"date": "Qua. 28 Mai.", "from": "São Bento do Una - PE", "to": "Garanhuns - PE", "driver": "Mateus Valença", "photo": "1", "stars": "1,5", "value": "16,00"},
    {"date": "Qui. 29 Mai.", "from": "Garanhuns - PE", "to": "Jupi - PE", "driver": "Carlos Santos", "photo": "2", "stars": "5,0", "value": "12,00"},
    {"date": "Qui. 29 Mai.", "from": "Arcoverde - PE", "to": "Garanhuns - PE", "driver": "Erick Martins", "photo": "1", "stars": "4,2", "value": "13,00"},
  ];

  bool userLoaded = false;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    dynamic result = await SharedPreference.getUser();
    print("USER FROM PREFS: $result");
    setState(() {
      user = User.fromJson(result);
      userLoaded = true;
    });
  }

  bool isInitialized() {
    return userLoaded;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (!isInitialized()) {
      return Scaffold(
        backgroundColor: theme.colorScheme.secondary,
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      backgroundColor: theme.colorScheme.secondary,
      appBar: CustomAppbar(
        addBackButton: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      "assets/mocks/profile_mock.jpg",
                      height: 75,
                      width: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Bem-vindo(a) de volta, ${user.name}!',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.tertiary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'Para onde você quer ir?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.tertiary,
                ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: toDestinyController,
                icon: Icons.pin_drop_rounded,
                label: 'Para',
              ),
              const SizedBox(height: 40),
              Text(
                'Viagens próximas a você',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.tertiary,
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ridesList.length,
                itemBuilder: (context, index) {
                  final ride = ridesList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: CustomCard(
                      date: ride["date"]!,
                      from: ride["from"]!,
                      to: ride["to"]!,
                      driver: ride["driver"]!,
                      photo: ride["photo"]!,
                      stars: ride["stars"]!,
                      value: ride["value"]!,
                      navigateTo: TravelPage(
                        date: ride["date"]!,
                        from: ride["from"]!,
                        to: ride["to"]!,
                        driver: ride["driver"]!,
                        photo: ride["photo"]!,
                        stars: ride["stars"]!,
                        value: ride["value"]!
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavbar(),
    );
  }
}
