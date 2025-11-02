import 'package:flutter/material.dart';

void main() {
  runApp(const PersonalProfileApp());
}

class PersonalProfileApp extends StatefulWidget {
  const PersonalProfileApp({super.key});

  @override
  State<PersonalProfileApp> createState() => _PersonalProfileAppState();
}

class _PersonalProfileAppState extends State<PersonalProfileApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Profile',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      home: ProfileScreen(
        onThemeToggle: _toggleTheme,
        isDarkMode: _themeMode == ThemeMode.dark,
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const ProfileScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: onThemeToggle,
            tooltip: isDarkMode ? 'Light Mode' : 'Dark Mode',
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive layout: single column on mobile, two columns on tablet+
          final isWideScreen = constraints.maxWidth > 600;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(isWideScreen ? 24.0 : 16.0),
              child: isWideScreen
                  ? _buildWideLayout(context)
                  : _buildNarrowLayout(context),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildProfileHeader(context),
        const SizedBox(height: 24),
        _buildAboutCard(context),
        const SizedBox(height: 16),
        _buildSkillsCard(context),
        const SizedBox(height: 16),
        _buildExperienceCard(context),
        const SizedBox(height: 16),
        _buildSocialLinksCard(context),
      ],
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildProfileHeader(context),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  _buildAboutCard(context),
                  const SizedBox(height: 16),
                  _buildExperienceCard(context),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  _buildSkillsCard(context),
                  const SizedBox(height: 16),
                  _buildSocialLinksCard(context),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(Icons.person, size: 80, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              'Man Nguyen',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Software Engineer',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  'Da Nang, Viet Nam',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'About Me',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Passionate Flutter developer with 3+ years of experience building '
              'beautiful and performant cross-platform applications. I love creating '
              'intuitive user experiences and writing clean, maintainable code.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsCard(BuildContext context) {
    final skills = [
      {'name': 'Java', 'icon': Icons.coffee, 'level': 0.9},
      {'name': 'Spring Boot', 'icon': Icons.cloud, 'level': 0.85},
      {'name': 'JavaScript/TypeScript', 'icon': Icons.code, 'level': 0.85},
      {'name': 'Angular', 'icon': Icons.developer_mode, 'level': 0.8},
      {'name': 'Kubernetes', 'icon': Icons.storage, 'level': 0.8},
      {'name': 'Docker', 'icon': Icons.dock, 'level': 0.8},
      {'name': 'Git', 'icon': Icons.merge_type, 'level': 0.85},
    ];

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.stars, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Skills',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...skills.map(
              (skill) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          skill['icon'] as IconData,
                          size: 20,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          skill['name'] as String,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: skill['level'] as double,
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerHighest,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.work_outline,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Experience',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  Icons.business,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              title: const Text('Software Engineer'),
              subtitle: const Text('Enlab Software\n4 months - Present'),
              isThreeLine: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLinksCard(BuildContext context) {
    final socialLinks = [
      {
        'icon': Icons.email,
        'title': 'Email',
        'subtitle': 'vanman04.w@gmail.com',
        'color': Colors.red,
      },
      {
        'icon': Icons.phone,
        'title': 'Phone',
        'subtitle': '0339228240',
        'color': Colors.green,
      },
      {
        'icon': Icons.code,
        'title': 'GitHub',
        'subtitle': 'github.com/man',
        'color': Colors.black,
      },
      {
        'icon': Icons.business,
        'title': 'LinkedIn',
        'subtitle': 'linkedin.com/in/man',
        'color': Colors.blue,
      },
    ];

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.connect_without_contact,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Contact & Social',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...socialLinks.map(
              (link) => ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 4),
                leading: CircleAvatar(
                  backgroundColor: (link['color'] as Color).withValues(
                    alpha: 0.2,
                  ),
                  child: Icon(
                    link['icon'] as IconData,
                    color: link['color'] as Color,
                    size: 20,
                  ),
                ),
                title: Text(link['title'] as String),
                subtitle: Text(link['subtitle'] as String),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Opening ${link['title']}...'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
