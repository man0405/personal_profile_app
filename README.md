# Personal Profile App

A Flutter application showcasing basic layout and responsive UI design principles. This app displays personal information, profile details, skills, experience, and social links in a clean and professional manner.
## 🎬 Demo

Watch the demo video of the app using one of the links below.

- Play on GitHub (opens file viewer): [Demo video](https://github.com/man0405/personal_profile_app/blob/main/assets/demo.mp4)
- Direct raw file (opens in browser/player): https://raw.githubusercontent.com/man0405/personal_profile_app/main/assets/demo.mp4


## 🎯 Project Goal

Learn basic Flutter layouts and create responsive user interfaces with proper theme support.

## ✨ Features

- **Responsive Layout**: Adapts between mobile (single column) and tablet/desktop (multi-column) layouts
- **Dark Mode Toggle**: Switch between light and dark themes seamlessly
- **Profile Information**: Display name, title, location, and profile picture
- **About Section**: Personal description and bio
- **Skills Display**: Visual skill levels with progress indicators
- **Experience Timeline**: Work history with company details
- **Social Links**: Contact information and social media links with interactive tiles

## 🛠️ Technical Implementation

### Flutter Widgets Used

- **Column**: Main vertical layout structure
# Personal Profile App

A Flutter application showcasing basic layout and responsive UI design principles. This app displays personal information, profile details, skills, experience, and social links in a clean and professional manner.

## 🎯 Project Goal

Learn basic Flutter layouts and create responsive user interfaces with proper theme support.

## ✨ Features

- **Responsive Layout**: Adapts between mobile (single column) and tablet/desktop (multi-column) layouts
- **Dark Mode Toggle**: Switch between light and dark themes seamlessly
- **Profile Information**: Display name, title, location, and profile picture
- **About Section**: Personal description and bio
- **Skills Display**: Visual skill levels with progress indicators
- **Experience Timeline**: Work history with company details
- **Social Links**: Contact information and social media links with interactive tiles

## 🛠️ Technical Implementation

### Flutter Widgets Used

- **Column**: Main vertical layout structure
- **ListTile**: Used for experience entries and social links
- **CircleAvatar**: Profile picture and list item icons
- **Card**: Elevated cards for section containers
- **LayoutBuilder**: Responsive layout detection
- **SingleChildScrollView**: Scrollable content
- **Row**: Horizontal layouts for wide screens
- **LinearProgressIndicator**: Skill level visualization

### Key Features

#### Responsive Design
- Uses `LayoutBuilder` to detect screen width
- Switches between single-column (mobile) and two-column (tablet+) layouts at 600px breakpoint
- Dynamic padding and spacing based on screen size

#### Theme Management
- Material Design 3 (Material You) implementation
- Light and dark theme support
- Theme toggle button in AppBar
- Consistent color scheme using `ColorScheme.fromSeed()`

#### UI Components
- Profile header with avatar, name, title, and location
- About Me card with descriptive text
- Skills card with icon, name, and proficiency bars
- Experience section with job history
- Social/Contact links with interactive feedback

## 📱 Screenshots

The app displays:
- Clean profile header with circular avatar
- Professional skill visualization
- Work experience timeline
- Interactive social media links
- Smooth theme transitions



## 🚀 Running the App

### Prerequisites
- Flutter SDK (3.9.2 or higher)
- Dart SDK
- iOS Simulator / Android Emulator / Physical Device

### Installation

1. Clone the repository or navigate to the project directory
2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

### Available Platforms
- iOS
- Android
- Web
- macOS
- Linux
- Windows

## 📝 Code Structure

```
lib/
└── main.dart          # Main application entry point
    ├── PersonalProfileApp     # Root app widget with theme management
    ├── ProfileScreen          # Main profile screen
    │   ├── _buildProfileHeader()      # Profile avatar and basic info
    │   ├── _buildAboutCard()          # About me section
    │   ├── _buildSkillsCard()         # Skills with progress bars
    │   ├── _buildExperienceCard()     # Work experience
    │   └── _buildSocialLinksCard()    # Contact and social links
    ├── _buildNarrowLayout()   # Mobile layout (single column)
    └── _buildWideLayout()     # Tablet/Desktop layout (two columns)
```

## 🎨 Customization

To customize the profile with your own information, edit the following in `main.dart`:

1. **Profile Header** (line ~153):
   - Name: Change `'Man Nguyen'`
   - Title: Change `'Software Engineer'`
   - Location: Change `'Da Nang, VN'`

2. **About Section** (line ~207):
   - Update the description text

3. **Skills** (line ~224):
   - Add/remove skills from the `skills` list
   - Adjust skill levels (0.0 to 1.0)

4. **Experience** (line ~330):
   - Update job titles, companies, and dates

5. **Social Links** (line ~373):
   - Update contact information and URLs

## 💡 Learning Outcomes

This project demonstrates:
- ✅ Basic Flutter layout widgets (Column, Row, Card)
- ✅ Responsive design techniques with LayoutBuilder
- ✅ Material Design 3 theming
- ✅ Light/Dark mode implementation
- ✅ ListTile for consistent list layouts
- ✅ CircleAvatar for profile pictures and icons
- ✅ State management with StatefulWidget
- ✅ Widget composition and code organization
- ✅ Interactive UI elements with callbacks

## 📦 Dependencies

- `flutter`: SDK for building the app
- `flutter_lints`: Linting rules for code quality

## 🔄 Future Enhancements

Potential improvements:
- Add real profile image support
- Implement actual URL launching for social links
- Add animations and transitions
- Include project portfolio section
- Add contact form
- Implement data persistence
- Add edit profile functionality

## 📄 License

This project is created for educational purposes.

---

**Built with Flutter 💙**
