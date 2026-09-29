# Somber — A Modern Dark Theme for GNUstep

A contemporary dark GNUstep theme with refined surfaces, elevated controls, and vibrant purple accent (#8050FF) for modern interactions.

**Original Author:** Bertrand Dekoninck (2021)  
**Current Maintainer:** 0smiridium (2026)  
**Version:** 2.0

## What's new in version 2.0

- **Enhanced Purple Accent:** Updated to #8050FF for a more vibrant, contemporary feel
- **Improved Visual Hierarchy:** Subtle elevation effects with refined shadows
- **Modern Button Design:** Larger rounded corners (8px), elevated surfaces, and dynamic border thickness
- **Contemporary Scrollbars:** Minimalist thin scrollbars with accent highlights (arrow buttons hidden)
- **Better State Feedback:** Clear visual distinction between normal, highlighted, and active states
- **Refined Color Palette:** Optimized contrast and saturation for modern displays
- **Smooth Transitions:** Prepared for future animation support

## Design Philosophy

Somber 2.0 embraces modern design principles:
- **Flat with Depth:** Minimal borders but strategic shadows for visual hierarchy
- **Contemporary Typography:** Crisp, high-contrast text for readability
- **Accent-Driven Interactions:** Bold purple accent guides user focus
- **Minimalist Controls:** Clean, uncluttered interface elements
- **Dark Theme Benefits:** Reduced eye strain and battery efficiency

## Features

- 🎨 Dark, sophisticated color scheme
- 💜 Vibrant purple accent color (#8050FF)
- 🎯 Clear interactive states and focus indicators
- ⚡ Lightweight theme bundle
- 🖼️ Compatible with GNUstep's theme system
- 🎭 Support for global or in-window menus

## Installation

### Prerequisites

Ensure you have GNUstep development tools installed:

**Debian/Ubuntu:**
```bash
sudo apt-get install gnustep-devel gnustep-make
```

**Fedora/RHEL:**
```bash
sudo dnf install gnustep-devel
```

**Arch Linux:**
```bash
sudo pacman -S gnustep-core
```

### Build and Install

```bash
git clone https://github.com/0smiridium/Somber.git
cd Somber
source /usr/share/GNUstep/Makefiles/GNUstep.sh
make -f GNUmakefile
make -f GNUmakefile install GNUSTEP_INSTALLATION_DOMAIN=USER
```

### Activate the Theme

```bash
defaults write NSGlobalDomain GSTheme Sombre
```

## Menu Styles

The theme uses macOS-style global menubar by default. Configure menu style with:

**Next Step menus:**
```bash
defaults write NSGlobalDomain NSMenuInterfaceStyle NSNextStepInterfaceStyle
```

**Windows 95-style menus:**
```bash
defaults write NSGlobalDomain NSMenuInterfaceStyle NSWindows95InterfaceStyle
```

## Color Palette

- **Primary Accent:** #8050FF (Vibrant Purple)
- **Background:** #0F0F0F (Near Black)
- **Surface:** #1A1A1A (Dark Gray)
- **Text:** #FFFFFF (High Contrast White)
- **Borders:** Dynamic based on state

## License

GNU General Public License v3.0 - See LICENSE file for details
