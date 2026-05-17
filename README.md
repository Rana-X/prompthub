[![English](https://img.shields.io/badge/English-454545?style=flat-square)](README.md)
[![Simplified Chinese](https://img.shields.io/badge/Simplified%20Chinese-454545?style=flat-square)](README.zh.md)

# PromptHub

Launch saved prompts into any AI tool from one local macOS command center.

PromptHub gives you one place to keep reusable prompts and one gesture to paste them into ChatGPT, Claude, Cursor, your browser, or any app with a focused text field.

Free and open source · All local, no network · Native macOS

- Website: https://rana-x.github.io/prompthub/
- Download: https://github.com/Rana-X/prompthub/releases/latest/download/PromptHub-1.3.1-macOS.zip

- [Three Ways to Use It](#three-ways-to-use-it)
- [Settings](#settings)
- [Design Choices](#design-choices)
- [Install](#install)
- [FAQ](#faq)

## Three Ways to Use It

- **Screen edge** — Slide to the screen edge. Browse your prompts, click to paste. Or press `Ctrl+Opt+Space` to open from the keyboard.
- **Shortcut** — Assign a letter A-Z to any prompt. Press `Ctrl+Opt+R` and it is pasted instantly.
- **Keyword** — Set a keyword like `;kit`. Type it anywhere and your prompt replaces it in place.

All three get your prompt into the active text field, or onto your clipboard if nothing is focused. The sidebar is for browsing. Shortcuts and keywords keep your hands on the keyboard.

## Settings

PromptHub keeps settings intentionally small:

- **Sidebar position** — place the sidebar on the left or right edge.
- **Screen edge trigger** — turn edge activation on or off.
- **Display** — follow the focused screen or pin PromptHub to a specific display.
- **Appearance** — use system, light, or dark mode.

## Design Choices

- **Everything stays on your machine.** Your prompts never leave your Mac. There are no analytics, telemetry, update checks, accounts, or cloud sync.
- **Native macOS, not Electron.** PromptHub is built with SwiftUI, SwiftData, and AppKit system integration.
- **Accessibility permission, and nothing more.** PromptHub uses macOS Accessibility APIs to paste into other apps, detect shortcuts, and respond to keywords. It keeps only a short in-memory keyword buffer for local expansion, and it does not read screen content or access data from other apps.
- **Compact command-center UI.** The interface is tuned for a focused, Cursor-like dark workspace while staying native to macOS.
- **Free and open source.** Every line of code is public under GPL v3.

## Install

Download the latest macOS build from [GitHub Releases](https://github.com/Rana-X/prompthub/releases/latest/download/PromptHub-1.3.1-macOS.zip).

For local development:

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer \
xcodebuild -project PromptHub.xcodeproj \
  -scheme PromptHub \
  -configuration Debug \
  -derivedDataPath /tmp/prompthub-derived \
  -destination 'platform=macOS' \
  build
open /tmp/prompthub-derived/Build/Products/Debug/PromptHub.app
```

## FAQ

### Why does PromptHub need Accessibility permission?

To paste prompts into other apps, PromptHub simulates Cmd+V through macOS Accessibility APIs. The same permission lets it detect per-prompt shortcuts (`Ctrl+Opt` + letter) and keyword typing. That is all it is used for.

### I clicked a prompt but nothing was pasted.

Your prompt is on the clipboard. Press Cmd+V to paste manually. This usually happens when no text field is focused in the target app.

### What is the difference between the sidebar and shortcuts?

The sidebar is for browsing: find and click, no memorization needed. Shortcuts (`Ctrl+Opt` + letter) and keywords (`;kit`) are for when you are already typing.

### How should I set up keywords?

Start keywords with a symbol: `;kit`, `/reply`, `.git`. This prevents PromptHub from triggering when you type normal words. One caveat: keywords that are prefixes of each other cannot coexist (`;ki` and `;kit` would conflict).

### `Ctrl+Opt+Space` conflicts with my input method switching.

If you switch between input languages, macOS may already use this shortcut. Try changing your input method shortcut to `Ctrl+Space` or Caps Lock in System Settings > Keyboard.

### Where is my data stored?

All prompts are stored locally on your Mac using SwiftData, in `~/Library/Application Support/PromptHub/PromptHub.store`. Nothing is synced, uploaded, or sent anywhere.

## Feedback

- **Bug reports** — [open an issue](https://github.com/Rana-X/prompthub/issues/new/choose)
- **Feature requests** — [start a discussion](https://github.com/Rana-X/prompthub/discussions/new?category=ideas)
- **Questions** — [ask in discussions](https://github.com/Rana-X/prompthub/discussions/new?category=q-a)

## License

[GPL v3](LICENSE)
