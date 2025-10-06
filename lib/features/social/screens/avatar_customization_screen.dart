import 'package:flutter/material.dart';

class AvatarCustomizationScreen extends StatefulWidget {
  const AvatarCustomizationScreen({super.key});

  @override
  State<AvatarCustomizationScreen> createState() =>
      _AvatarCustomizationScreenState();
}

class _AvatarCustomizationScreenState extends State<AvatarCustomizationScreen> {
  String _selectedCategory = 'face';
  int _selectedSkinTone = 0;
  int _selectedHairStyle = 0;
  int _selectedAccessory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customize Avatar'),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: Save avatar customization
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildAvatarPreview(),
          const Divider(),
          _buildCustomizationCategories(),
          Expanded(child: _buildCustomizationOptions()),
        ],
      ),
    );
  }

  Widget _buildAvatarPreview() {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const Icon(Icons.person, size: 120, color: Colors.white),
          ),
          Positioned(
            bottom: 0,
            right: MediaQuery.of(context).size.width / 4,
            child: FloatingActionButton.small(
              onPressed: () {
                // TODO: Implement random customization
              },
              child: const Icon(Icons.shuffle),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomizationCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          _buildCategoryChip('face', 'Face', Icons.face),
          _buildCategoryChip('hair', 'Hair', Icons.content_cut),
          _buildCategoryChip('eyes', 'Eyes', Icons.remove_red_eye),
          _buildCategoryChip('mouth', 'Mouth', Icons.tag_faces),
          _buildCategoryChip(
            'accessories',
            'Accessories',
            Icons.emoji_emotions,
          ),
          _buildCategoryChip('outfits', 'Outfits', Icons.checkroom),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String value, String label, IconData icon) {
    final isSelected = _selectedCategory == value;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChip(
        selected: isSelected,
        label: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            const SizedBox(width: 4),
            Text(label),
          ],
        ),
        onSelected: (bool selected) {
          setState(() {
            _selectedCategory = value;
          });
        },
      ),
    );
  }

  Widget _buildCustomizationOptions() {
    return Column(
      children: [
        if (_selectedCategory == 'face')
          _buildColorPalette('Skin Tone', _selectedSkinTone, (index) {
            setState(() {
              _selectedSkinTone = index;
            });
          }),
        if (_selectedCategory == 'hair')
          _buildStyleGrid('Hair Styles', _selectedHairStyle, (index) {
            setState(() {
              _selectedHairStyle = index;
            });
          }),
        if (_selectedCategory == 'accessories')
          _buildAccessoryGrid('Accessories', _selectedAccessory, (index) {
            setState(() {
              _selectedAccessory = index;
            });
          }),
      ],
    );
  }

  Widget _buildColorPalette(
    String title,
    int selectedIndex,
    Function(int) onSelected,
  ) {
    final colors = [
      Colors.brown.shade200,
      Colors.brown.shade300,
      Colors.brown.shade400,
      Colors.brown.shade500,
      Colors.brown.shade600,
      Colors.brown.shade700,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: List.generate(
              colors.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 16),
                child: InkWell(
                  onTap: () => onSelected(index),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: colors[index],
                    child: selectedIndex == index
                        ? const Icon(Icons.check, color: Colors.white)
                        : null,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStyleGrid(
    String title,
    int selectedIndex,
    Function(int) onSelected,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => onSelected(index),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(8),
                    border: selectedIndex == index
                        ? Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          )
                        : null,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.face,
                      size: 32,
                      color: selectedIndex == index
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAccessoryGrid(
    String title,
    int selectedIndex,
    Function(int) onSelected,
  ) {
    final accessories = [
      Icons.sports_esports,
      Icons.headphones,
      Icons.grade,
      Icons.pets,
      Icons.music_note,
      Icons.favorite,
      Icons.star,
      Icons.local_fire_department,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: accessories.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => onSelected(index),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(8),
                    border: selectedIndex == index
                        ? Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          )
                        : null,
                  ),
                  child: Icon(
                    accessories[index],
                    size: 32,
                    color: selectedIndex == index
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
