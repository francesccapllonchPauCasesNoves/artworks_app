# Artworks App 🎨🖼️

A cross-platform **Flutter** application designed for browsing, searching, and discovering famous artworks and artists. Built with a clean UI, smooth navigation, and asynchronous API consumption.

## ✨ Features

- **Artwork Gallery & Discovery:** Browse curated collections of artworks with high-resolution previews.
- **Detailed Artwork View:** Inspect individual pieces with information about the artist, creation date, medium, and description.
- **Search Functionality:** Quickly search and filter artworks by title, artist, or keyword.
- **Responsive & Smooth UI:** Custom cards, image placeholders/fade-in loading, and intuitive navigation across screens.

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev/)
- **Language:** [Dart](https://dart.dev/)
- **Networking & State:** HTTP / REST API integration & reactive state management (`Provider`)

## 📂 Project Structure

```text
lib/
├── main.dart        # App entry point, theme setup & routes
├── models/          # Data models for artworks and API responses
├── providers/       # State management & API data fetching logic
├── screens/         # App screens (Home, Artwork Details, Search)
└── widgets/         # Reusable UI widgets (cards, sliders, custom views)
