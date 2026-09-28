import 'package:flutter/material.dart';

void main() {
  runApp(const MiloopApp());
}

class MiloopApp extends StatelessWidget {
  const MiloopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miloop Social App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8E7B5),
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final featured = [
      FeaturedCard(
        title: 'SAVE\nTHE\nAMIDS',
        image:
            'https://images.unsplash.com/photo-1518546305927-5a555bb7020d?auto=format&fit=crop&w=800&q=80',
        accent: const Color(0xFFB87A14),
      ),
      FeaturedCard(
        title: 'MILOOP\n2026',
        image:
            'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=800&q=80',
        accent: const Color(0xFFE4B349),
      ),
    ];

    final profiles = [
      ProfileCard(
        image:
            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=800&q=80',
        name: 'Shivam',
        room: 'Room No. 16',
        count: '114',
      ),
      ProfileCard(
        image:
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=800&q=80',
        name: 'Emaan',
        room: 'Room No. 15',
        count: '110',
      ),
    ];

    final rankList = [
      {'name': 'Room Lv.16', 'value': '280'},
      {'name': 'Room Lv.15', 'value': '360'},
      {'name': 'Room Lv.12', 'value': '1120'},
      {'name': 'Room Lv.10', 'value': '1680'},
      {'name': 'Room Lv.8', 'value': '2800'},
      {'name': 'Room Lv.7', 'value': '5600'},
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF5E9BF), Color(0xFFE7C970)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _StatusBar(),
              const SizedBox(height: 8),
              _SearchBar(),
              const SizedBox(height: 10),
              _CategoryTabs(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          childAspectRatio: 1.44,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          children: featured
                              .map(
                                (card) => card,
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          childAspectRatio: 1.12,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          children: profiles
                              .map(
                                (card) => card,
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: _LeaderBoardCard(
                                rankList: rankList,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _TigerCard(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: _DreamCard(),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _RomanceCard(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 12, top: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFE2C46F),
          border: Border(top: BorderSide(color: Colors.amber.shade700, width: 1.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home_outlined, size: 30),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble_outline, size: 30),
            ),
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: const Color(0xFFB8881C),
                border: Border.all(color: Colors.amber.shade200, width: 3),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(Icons.add, size: 34, color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.star_outline, size: 30),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person_outline, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 0),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              '8:30 PM',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            children: const [
              Icon(Icons.cell_tower, size: 18),
              SizedBox(width: 8),
              Icon(Icons.wifi, size: 18),
              SizedBox(width: 8),
              Icon(Icons.battery_4_bar_rounded, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.65),
          border: Border.all(color: Colors.amber.shade700, width: 1.4),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, size: 22, color: Colors.black54),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'Search for Nickname/ID',
                style: TextStyle(fontSize: 16, color: Color(0xFF4D4D4D)),
              ),
            ),
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(Icons.person, size: 20, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CategoryTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabs = ['Hot', 'Party', 'Video', 'India'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final selected = index == 0;
          return Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Text(
              tabs[index],
              style: TextStyle(
                fontSize: selected ? 31 : 24,
                fontWeight: selected ? FontWeight.w900 : FontWeight.w600,
                color: selected ? const Color(0xFFf06b1d) : const Color(0xFF4A3D2A),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class FeaturedCard extends StatelessWidget {
  final String title;
  final String image;
  final Color accent;

  const FeaturedCard({
    super.key,
    required this.title,
    required this.image,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amber.shade800, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 6),
            )
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              image,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.05), Colors.black.withOpacity(0.42)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              left: 12,
              bottom: 10,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: title.contains('2026') ? 28 : 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: accent,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String image;
  final String name;
  final String room;
  final String count;

  const ProfileCard({
    super.key,
    required this.image,
    required this.name,
    required this.room,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEFBB5B), width: 2),
        gradient: const LinearGradient(
          colors: [Color(0xFFF2E0A9), Color(0xFFE9C55F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  Image.network(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        room,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF33231A),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'I': i'${count}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF41240B),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LeaderBoardCard extends StatelessWidget {
  final List<Map<String, String>> rankList;

  const _LeaderBoardCard({required this.rankList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFB57A14), Color(0xFF6E370B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.amber.shade300, width: 2),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Icon(Icons.local_fire_department, color: Colors.amber, size: 18),
              SizedBox(width: 6),
              Text(
                'Miloop',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...rankList.take(5).map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item['name']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    item['value']!,
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Official Admin',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.amber.shade100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TigerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7E2D0A), Color(0xFF9B4E18)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.orange.shade300, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'TIGER',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.w900,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 8),
          CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            backgroundImage: const NetworkImage(
              'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=400&q=80',
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Miss Sohni',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Number: 0370 2662 510',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _DreamCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [Color(0xFF060606), Color(0xFF2F0B26)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.amber.shade600, width: 2),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.purple.shade900,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Dream',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://images.unsplash.com/photo-1521119989659-a83eee488004?auto=format&fit=crop&w=600&q=80',
              height: 120,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '03168583318',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                '44331',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _RomanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [Color(0xFF0C0C0C), Color(0xFF3D0A16)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.yellow.shade700, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1521119989659-a83eee488004?auto=format&fit=crop&w=600&q=80',
              height: 170,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Love Story',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

extension on String {
  String get i => this;
}
