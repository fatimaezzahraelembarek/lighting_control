import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../domain/entities/room.dart';
import 'package:provider/provider.dart';
import '../controllers/lighting_controller.dart';

class RoomConfigPage extends StatefulWidget {
  final Room room;

  const RoomConfigPage({Key? key, required this.room}) : super(key: key);

  @override
  _RoomConfigPageState createState() => _RoomConfigPageState();
}

class _RoomConfigPageState extends State<RoomConfigPage> {
  late double _lightLevel;
  late String _lightType;
  late bool _isOutOfOrder;

  @override
  void initState() {
    super.initState();
    _lightLevel = widget.room.lightLevel.toDouble();
    _lightType = "LED"; // Default value
    _isOutOfOrder = widget.room.isOutOfOrder;
  }

  void _toggleOutOfOrder(bool? value) {
    setState(() {
      _isOutOfOrder = value!;
      final controller = Provider.of<LightingController>(context, listen: false);
      // Find the room index using the room name
      final roomIndex = controller.rooms.indexWhere((room) => room.name == widget.room.name);
      if (roomIndex != -1) {
        controller.toggleOutOfOrder(roomIndex, _isOutOfOrder);
      }
    });
  }


  void _copyToClipboard() {
    final text =
        'Room: ${widget.room.name}\nState: ${_lightLevel.toInt()}%\nType: $_lightType\nOut of order: $_isOutOfOrder';
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Copied to clipboard!')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.room.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'State',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _lightLevel,
              min: 0,
              max: 100,
              divisions: 10,
              label: '${_lightLevel.toInt()}%',
              onChanged: _isOutOfOrder
                  ? null // Disable the slider if "Out of order"
                  : (value) {
                setState(() {
                  _lightLevel = value;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Type',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _lightType,
              items: const [
                DropdownMenuItem(value: 'LED', child: Text('LED')),
                DropdownMenuItem(value: 'Halogen', child: Text('Halogen')),
              ],
              onChanged: (value) {
                setState(() {
                  _lightType = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Light (lumens)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              initialValue: '2500', // Default example value
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Lumens',
              ),
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              title: const Text('Out of order'),
              value: _isOutOfOrder,
              onChanged: _toggleOutOfOrder, // Use the updated toggle method
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _copyToClipboard,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: const Text('Copy to clipboard'),
            ),
          ],
        ),
      ),
    );
  }
}
