import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/lighting_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lightingController = Provider.of<LightingController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lights'),
      ),
      body: Column(
        children: [
          // Boutons pour allumer/éteindre toutes les lumières
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: lightingController.turnOffAllLights,
                  icon: const Icon(Icons.lightbulb_outline),
                  label: const Text('Off'),
                ),
                ElevatedButton.icon(
                  onPressed: lightingController.turnOnAllLights,
                  icon: const Icon(Icons.lightbulb),
                  label: const Text('On'),
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
                  leading: Icon(
                    room.isOutOfOrder ? Icons.warning : Icons.lightbulb,
                    color: room.isOutOfOrder ? Colors.red : Colors.yellow,
                  ),
                  title: Text(room.name),
                  subtitle: room.isOutOfOrder
                      ? const Text('Out of Order')
                      : Slider(
                    value: room.lightLevel.toDouble(),
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: '${room.lightLevel}%',
                    onChanged: (value) {
                      lightingController.updateLightLevel(
                          index, value.toInt());
                    },
                  ),
                  trailing: Text('${room.lightLevel}%'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
