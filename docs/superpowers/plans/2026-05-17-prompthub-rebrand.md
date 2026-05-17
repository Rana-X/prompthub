# PromptHub Rebrand Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Rebrand the Hodor macOS prompt launcher into PromptHub in the `Rana-X/prompthub` repository.

**Architecture:** Keep the existing SwiftUI/AppKit app architecture and SwiftData storage model. Rebrand the app identity at the project, bundle, docs, settings, and user-facing string layers while keeping behavior stable.

**Tech Stack:** Swift 6, SwiftUI, SwiftData, AppKit, Xcode project, GPLv3.

---

## File Map

- Copy from `/Users/ranax/Downloads/hodor`: app source, project files, README files, license, resources, GitHub templates.
- Modify `project.yml`, `Package.swift`, `PromptPal.xcodeproj/project.pbxproj`, `Resources/Info.plist`, and entitlements naming to build `PromptHub.app`.
- Modify Swift files under `Sources/` for user-visible text, bundle/storage identifiers, logging subsystem names, and type names where renaming is low risk.
- Modify `README.md`, `README.zh.md`, `.github/ISSUE_TEMPLATE/*`, `.gitignore`, and `LICENSE` for PromptHub docs and links.
- Add `.superpowers/` and `.playwright-mcp/` ignores so brainstorm/test artifacts stay local.

## Tasks

### Task 1: Import upstream source

- [ ] Copy all non-git files from `/Users/ranax/Downloads/hodor` into `/Users/ranax/Downloads/prompthub`.
- [ ] Keep the existing PromptHub `.git` directory and `origin` remote.
- [ ] Verify `git status --short --branch` shows the imported app files.

### Task 2: Rename project identity

- [ ] Rename `PromptPal.xcodeproj` to `PromptHub.xcodeproj`.
- [ ] Rename `Sources/PromptPalApp.swift` to `Sources/PromptHubApp.swift`.
- [ ] Rename `Resources/PromptPal.entitlements` to `Resources/PromptHub.entitlements`.
- [ ] Rename `HodorIcon.icon` to `PromptHubIcon.icon`.
- [ ] Update `Package.swift`, `project.yml`, and `PromptHub.xcodeproj/project.pbxproj` so the product builds as `PromptHub.app` with bundle ID `com.ranax.prompthub`.

### Task 3: Rebrand runtime strings and identifiers

- [ ] Replace user-facing app strings with `PromptHub`.
- [ ] Update GitHub source links to `https://github.com/Rana-X/prompthub`.
- [ ] Update logger subsystem strings to `com.ranax.prompthub`.
- [ ] Update UserDefaults keys to `com.ranax.prompthub`.
- [ ] Update SwiftData storage path to `~/Library/Application Support/PromptHub/PromptHub.store`.
- [ ] Leave compatibility mentions of Hodor only where they preserve upstream attribution or explain derivative history.

### Task 4: Apply compact Cursor-like native polish

- [ ] Rename `HodorSurface` types and modifiers to `PromptHubSurface` equivalents.
- [ ] Tune fallback surface styling toward a darker compact command-center look.
- [ ] Keep native SwiftUI/AppKit materials and current layout behavior.

### Task 5: Rebrand docs and GitHub templates

- [ ] Rewrite README intro, install, feedback, FAQ, and license attribution for PromptHub.
- [ ] Update Simplified Chinese README with equivalent PromptHub links and names.
- [ ] Update issue template labels and discussion URLs.
- [ ] Add local tooling artifacts to `.gitignore`.

### Task 6: Verify and publish

- [ ] Run `rg` for stale upstream brand and repo references.
- [ ] Build with `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer xcodebuild -project PromptHub.xcodeproj -scheme PromptHub -configuration Debug -derivedDataPath /tmp/prompthub-derived -destination 'platform=macOS' build`.
- [ ] Launch `/tmp/prompthub-derived/Build/Products/Debug/PromptHub.app`.
- [ ] Commit the rebrand and push `main` to `origin`.
