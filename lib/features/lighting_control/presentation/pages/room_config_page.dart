import 'package:flutter/material.dart';
import '../../domain/entities/room.dart';

class RoomConfigPage extends StatelessWidget {
  final Room room;

  const RoomConfigPage({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(room.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'State',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Slider(
              value: room.lightLevel.toDouble(),
              min: 0,
              max: 100,
              divisions: 10,
              label: '${room.lightLevel}%',
              onChanged: room.isOutOfOrder
                  ? null
                  : (value) {
                // Implémentation de la mise à jour (si nécessaire)
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Type',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            DropdownButton<String>(
              value: 'LED',
              items: const [
                DropdownMenuItem(value: 'LED', child: Text('LED')),
                DropdownMenuItem(value: 'Halogen', child: Text('Halogen')),
              ],
              onChanged: (value) {
                // Implémentation du changement de type
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Light (lumens)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            TextFormField(
              initialValue: '2500',
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Lumens',
              ),
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              title: const Text('Out of order'),
              value: room.isOutOfOrder,
              onChanged: (value) {
                // Implémentation de l’état défectueux
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Copier les données dans le presse-papiers
              },
              child: const Text('Copy to clipboard'),
            ),
          ],
        ),
      ),
    );
  }
}
