# PromptHub Rebrand Design

## Goal

Turn the cloned Hodor macOS prompt launcher into PromptHub, a GPLv3 open-source app published from `Rana-X/prompthub`.

## Scope

- Work in `/Users/ranax/Downloads/prompthub`, not the upstream clone at `/Users/ranax/Downloads/hodor`.
- Copy the app source, project files, README files, GitHub issue templates, and license into the PromptHub repo.
- Replace visible product identity from Hodor/PromptPal to PromptHub.
- Replace GitHub links from `woody-design/hodor` to `Rana-X/prompthub`.
- Replace bundle and storage identifiers with PromptHub-owned identifiers.
- Keep GPLv3 licensing and upstream attribution. This is a derivative project, not a claim that the original source was written from scratch.
- Preserve current core behavior: local prompt storage, sidebar launcher, hotkeys, keyword replacement, Accessibility permission flow, and no network dependency.

## Product Identity

- App name: `PromptHub`
- Bundle identifier: `com.ranax.prompthub`
- Swift package and Xcode target: `PromptHub`
- App support folder: `~/Library/Application Support/PromptHub`
- Store path: `~/Library/Application Support/PromptHub/PromptHub.store`
- UserDefaults keys: move new keys under `com.ranax.prompthub`.

## Source Attribution And License

The repo remains GPLv3. The license header should identify PromptHub as a modified derivative of Hodor and preserve the original copyright notice for Woody Li. README documentation should state that PromptHub is based on Hodor and link to the upstream repository.

## Visual Direction

Use a compact Cursor-like native dark direction without copying Cursor branding: darker sidebar chrome, sharper contrast, tighter command-center feel, and restrained monochrome accents. Keep the SwiftUI structure and native macOS materials instead of replacing the app with a web-style UI.

## Acceptance Criteria

- `rg -n "woody-design/hodor|hodor.design|Hodor|PromptPal|promptpal|com.hodor|com.promptpal"` only returns intentional compatibility, attribution, or renamed type references that are documented.
- The app builds as `PromptHub.app`.
- Launching the app shows PromptHub in the permission/onboarding copy and macOS process list.
- README and issue templates point to `Rana-X/prompthub`.
- The repo can be pushed to `git@github.com:Rana-X/prompthub.git`.
