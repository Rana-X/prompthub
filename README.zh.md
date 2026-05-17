[English](README.md)
[简体中文](README.zh.md)

# PromptHub

把保存好的 prompt 从一个本地 macOS 指挥中心启动到任何 AI 工具里。

PromptHub 让你把常用 prompt 集中保存，然后通过一次点击、快捷键或关键词粘贴到 ChatGPT、Claude、Cursor、浏览器，或任何当前聚焦的输入框。

免费开源 · 完全本地，无网络请求 · 原生 macOS

- [三种使用方式](#三种使用方式)
- [设置](#设置)
- [设计选择](#设计选择)
- [安装](#安装)
- [常见问题](#常见问题)
- [致谢](#致谢)

[License: GPL v3](LICENSE)

## 三种使用方式

- **屏幕边缘** — 鼠标滑到屏幕边缘，弹出 prompt 列表，点击即粘贴。也可以按 `Ctrl+Opt+Space` 打开侧边栏。
- **快捷键** — 给任意 prompt 分配一个字母 A-Z。按 `Ctrl+Opt+A-Z`，直接粘贴。
- **关键词** — 设一个关键词，比如 `;kit`。在任何地方输入，prompt 原地替换。

三种方式做同一件事：把 prompt 送到当前输入框。如果没有聚焦的输入框，就复制到剪贴板。侧边栏适合浏览，快捷键和关键词适合正在输入时使用。

## 设置

PromptHub 的设置刻意保持很少：

- **侧边栏位置** — 放在屏幕左侧或右侧。
- **屏幕边缘触发** — 开启或关闭边缘唤起。
- **显示器** — 跟随当前聚焦的屏幕，或固定到某一块显示器。
- **外观** — 跟随系统，或使用浅色/深色模式。

## 设计选择

- **所有数据都在你的电脑上。** prompt 不会离开你的 Mac。不做分析，不做遥测，不检查更新，没有账号，也没有云同步。
- **原生 macOS，不是 Electron。** PromptHub 使用 SwiftUI、SwiftData 和 AppKit 系统集成构建。
- **只需要辅助功能权限。** PromptHub 使用 macOS 辅助功能 API 向其他 app 粘贴内容、检测快捷键并响应关键词。它不会记录按键、读取屏幕内容或访问其他 app 的数据。
- **紧凑的指挥中心界面。** 视觉上偏向 Cursor 风格的深色工作区，但仍保持原生 macOS 体验。
- **免费开源。** 所有代码以 GPL v3 公开。

## 安装

发布版本可在 [GitHub Releases](https://github.com/Rana-X/prompthub/releases) 下载。

本地开发构建：

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

## 常见问题

### 为什么需要辅助功能权限？

PromptHub 通过 macOS 辅助功能 API 模拟 Cmd+V，向其他 app 粘贴 prompt。同一个权限也用于检测快捷键（`Ctrl+Opt` + 字母）和关键词输入。仅此而已。

### 点了 prompt 但没有粘贴。

prompt 已经在剪贴板了，手动 Cmd+V 即可。通常是因为目标 app 的输入框没有获得焦点。

### 侧边栏和快捷键有什么区别？

侧边栏用来浏览：看一看，点一下，不用记任何东西。快捷键（`Ctrl+Opt` + 字母）和关键词（`;kit`）适合正在打字的时候。

### 关键词怎么设比较好？

用符号开头：`;kit`、`/reply`、`.git`。这样打普通单词的时候不会误触发。注意：互为前缀的关键词不能共存（`;ki` 和 `;kit` 会冲突）。

### `Ctrl+Opt+Space` 和输入法切换冲突了。

如果你使用中英文输入法切换，macOS 很可能已经占用了这个快捷键。建议在系统设置 -> 键盘 -> 输入法中，把切换快捷键改成 `Ctrl+Space` 或 Caps Lock。

### 我的数据存在哪里？

所有 prompt 都存在本地，使用 SwiftData，路径是 `~/Library/Application Support/PromptHub/PromptHub.store`。不同步，不上传，不发送。

## 反馈

- **Bug 反馈** — [提交 issue](https://github.com/Rana-X/prompthub/issues/new/choose)
- **功能建议** — [发起讨论](https://github.com/Rana-X/prompthub/discussions/new?category=ideas)
- **提问** — [在讨论区提问](https://github.com/Rana-X/prompthub/discussions/new?category=q-a)

## 致谢

PromptHub 是基于 [Hodor](https://github.com/woody-design/hodor) 修改的 GPLv3 衍生项目。Hodor 最初由 Woody Li 创建。本仓库维护 PromptHub 的品牌、bundle identity、文档和视觉方向。

## 许可证

[GPL v3](LICENSE)
