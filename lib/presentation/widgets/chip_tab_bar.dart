import 'package:flutter/material.dart';

class ChipsTabBar extends StatefulWidget {
  const ChipsTabBar({super.key});

  @override
  _ChipsTabBarState createState() => _ChipsTabBarState();
}

class _ChipsTabBarState extends State<ChipsTabBar> {
  int _selectedChipIndex = 0;

  final List<String> _tabs = [
    'All Account',
    'Browser',
    'Social Platform',
    // Add more tabs if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Chip Tab Bar
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(_tabs.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ChoiceChip(
                  label: Text(_tabs[index]),
                  selected: _selectedChipIndex == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _selectedChipIndex = index;
                    });
                  },
                  selectedColor: Colors.blue,
                  backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                    color: _selectedChipIndex == index
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              );
            }),
          ),
        ),

        // Display content based on selected chip
        Expanded(
          child: _getSelectedTabContent(),
        ),
      ],
    );
  }

  // Function to display different content for each tab
  Widget _getSelectedTabContent() {
    switch (_selectedChipIndex) {
      case 0:
        return const Center(child: Text('All Accounts Content'));
      case 1:
        return const Center(child: Text('Credit Cards Content'));
      case 2:
        return const Center(child: Text('OTA Platform Content'));
      default:
        return const Center(child: Text('Unknown Content'));
    }
  }
}
