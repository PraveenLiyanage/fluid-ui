# fluid_ui 🚀

**Intelligent Responsiveness for Flutter.**

`fluid_ui` is a next-generation adaptive rendering engine for Flutter that transforms static layouts into intelligent, device-aware experiences.

[![Pub Version](https://img.shields.io/pub/v/fluid_ui?color=blue)](https://pub.dev/packages/fluid_ui)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## ✨ Features

- 🧠 **Adaptive Layout Intelligence**: Automatically transforms `Row` → `Column`, `Sidebar` → `Drawer`, and more.
- 🛠️ **Overflow Recovery Engine**: Detects and prevents RenderFlex overflows before they happen.
- 🎯 **Semantic Priority Rendering**: Declare widget importance to automatically collapse low-priority elements on small screens.
- 📊 **Adaptive Tables**: Seamlessly converts `DataTable` into touch-optimized `Cards` on mobile.
- 🖋️ **Fluid Typography Engine**: Automatically scales font sizes and line heights for maximum readability.
- 🧱 **Auto Grid System**: Intelligent grid density calculation based on viewport width.
- 🗺️ **Adaptive Navigation**: Hybrid navigation patterns that adapt to the device form factor.

---

## 🚀 Getting Started

### Installation

Add `fluid_ui` to your `pubspec.yaml`:

```yaml
dependencies:
  fluid_ui: ^0.1.0
```

### Basic Usage

Wrap your app in `FluidApp` and use adaptive widgets:

```dart
import 'package:fluid_ui/fluid_ui.dart';

void main() {
  runApp(
    FluidApp(
      child: MaterialApp(
        home: AdaptiveScaffold(
          sidebar: Sidebar(),
          body: AdaptiveGrid(
            children: [
              StatCard(),
              AnalyticsCard(),
            ],
          ),
        ),
      ),
    ),
  );
}
```

---

## 🏗️ Core Widgets

### AdaptiveRow
Automatically switches between horizontal and vertical layouts.

### AdaptiveGrid
Calculates optimal column count based on available space.

### AdaptiveTable
Transforms data tables into responsive card lists for mobile.

### AdaptiveScaffold
Handles sidebar/drawer navigation state automatically.

---

## 🗺️ Roadmap

- [x] v0.1.0: Core adaptive widgets and breakpoint engine.
- [x] v0.2.0: AI-assisted layout heuristics.
- [x] v0.3.0: Visual adaptive inspector.
- [x] v1.0.0: Full enterprise toolkit & AI layout prediction.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
