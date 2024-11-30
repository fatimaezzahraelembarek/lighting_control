import 'package:flutter/material.dart';
import 'package:lighting_control/features/lighting_control/presentation/pages/room_config_page.dart';
import 'package:provider/provider.dart';
import '../controllers/lighting_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variable pour suivre l'état sélectionné : 0 = Off, 1 = On
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final lightingController = Provider.of<LightingController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lights'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section "All rooms" avec boutons stylisés "Off" et "On"
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'All rooms',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: ToggleButtons(
                    isSelected: [selectedIndex == 0, selectedIndex == 1],
                    onPressed: (index) {
                      setState(() {
                        selectedIndex = index;
                        if (index == 0) {
                          lightingController.turnOffAllLights();
                        } else {
                          lightingController.turnOnAllLights();
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(30),
                    selectedBorderColor: Colors.purple,
                    selectedColor: Colors.white,
                    fillColor: Colors.purple,
                    color: Colors.purple,
                    constraints: const BoxConstraints(
                      minHeight: 40,
                      minWidth: 100,
                    ),
                    children: const [
                      // Bouton "Off"
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.lightbulb_outline),
                          SizedBox(width: 5),
                          Text('Off'),
                        ],
                      ),
                      // Bouton "On"
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.lightbulb),
                          SizedBox(width: 5),
                          Text('On'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Liste des pièces
          Expanded(
            child: ListView.builder(
              itemCount: lightingController.rooms.length,
              itemBuilder: (context, index) {
                final room = lightingController.rooms[index];
                return ListTile(
                  leading: room.isOutOfOrder
                      ? Image.asset('assets/images/warning_purple.png', width: 24, height: 24)
                      : (room.lightLevel > 0
                      ? Image.asset('assets/images/light_on_purple.png', width: 24, height: 24)
                      : Image.asset('assets/images/light_off_purple.png', width: 24, height: 24)),

                  title: Text(room.name),
                  subtitle: Slider(
                    value: room.lightLevel.toDouble(),
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: '${room.lightLevel}%',
                    onChanged: (value) {
                      lightingController.updateLightLevel(index, value.toInt());
                    },
                  ),
                  trailing: Image.asset('assets/images/settings_purple.png', width: 24, height: 24),

                  onTap: () {
                    // Navigation vers la page de configuration
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RoomConfigPage(room: room),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
