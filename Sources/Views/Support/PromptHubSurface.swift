import AppKit
import SwiftUI

enum PromptHubSurfaceStyle {
    case sidebar
    case control
    case interactiveControl
    case toast

    var isInteractiveGlass: Bool {
        switch self {
        case .interactiveControl:
            return true
        case .sidebar, .control, .toast:
            return false
        }
    }

    var material: NSVisualEffectView.Material {
        switch self {
        case .sidebar:
            return .sidebar
        case .control, .interactiveControl, .toast:
            return .popover
        }
    }

    var blendingMode: NSVisualEffectView.BlendingMode {
        switch self {
        case .sidebar, .toast:
            return .behindWindow
        case .control, .interactiveControl:
            return .withinWindow
        }
    }

    var tintColor: Color {
        switch self {
        case .sidebar, .toast:
            return Color(red: 0.045, green: 0.055, blue: 0.070)
        case .control, .interactiveControl:
            return Color(red: 0.080, green: 0.095, blue: 0.120)
        }
    }

    var tintOpacity: Double {
        switch self {
        case .sidebar:
            return 0.72
        case .control:
            return 0.34
        case .interactiveControl:
            return 0.28
        case .toast:
            return 0.66
        }
    }

    var strokeOpacity: Double {
        switch self {
        case .sidebar:
            return 0.22
        case .control, .interactiveControl:
            return 0.16
        case .toast:
            return 0.20
        }
    }

    var strokeWidth: CGFloat {
        switch self {
        case .sidebar, .toast:
            return 1
        case .control, .interactiveControl:
            return 0.75
        }
    }

    var shadow: (color: Color, radius: CGFloat, y: CGFloat)? {
        switch self {
        case .sidebar:
            return (Color.black.opacity(0.30), 22, 10)
        case .toast:
            return (Color.black.opacity(0.26), 18, 7)
        case .control, .interactiveControl:
            return nil
        }
    }
}

struct PromptHubSurfaceContainer<Content: View>: View {
    private let usesLiquidGlass: Bool
    private let content: Content

    init(
        usesLiquidGlass: Bool = true,
        @ViewBuilder content: () -> Content
    ) {
        self.usesLiquidGlass = usesLiquidGlass
        self.content = content()
    }

    var body: some View {
        if usesLiquidGlass, #available(macOS 26.0, *) {
            GlassEffectContainer {
                content
            }
        } else {
            content
        }
    }
}

extension View {
    func promptHubSurface<S: Shape>(
        _ style: PromptHubSurfaceStyle,
        in shape: S,
        usesLiquidGlass: Bool = true
    ) -> some View {
        modifier(
            PromptHubSurfaceModifier(
                style: style,
                shape: shape,
                usesLiquidGlass: usesLiquidGlass
            )
        )
    }
}

private struct PromptHubSurfaceModifier<S: Shape>: ViewModifier {
    let style: PromptHubSurfaceStyle
    let shape: S
    let usesLiquidGlass: Bool

    @ViewBuilder
    func body(content: Content) -> some View {
        if usesLiquidGlass, #available(macOS 26.0, *) {
            liquidGlass(content: content)
        } else {
            fallback(content: content)
        }
    }

    @available(macOS 26.0, *)
    @ViewBuilder
    private func liquidGlass(content: Content) -> some View {
        if style.isInteractiveGlass {
            content.glassEffect(.regular.interactive(), in: shape)
        } else {
            content.glassEffect(.regular, in: shape)
        }
    }

    @ViewBuilder
    private func fallback(content: Content) -> some View {
        let fallback = content
            .background {
                ZStack {
                    PromptHubVisualEffectBackground(
                        material: style.material,
                        blendingMode: style.blendingMode
                    )
                    style.tintColor.opacity(style.tintOpacity)
                }
                .clipShape(shape)
            }
            .overlay {
                shape.stroke(
                    Color.primary.opacity(style.strokeOpacity),
                    lineWidth: style.strokeWidth
                )
            }
            .clipShape(shape)

        if let shadow = style.shadow {
            fallback.shadow(
                color: shadow.color,
                radius: shadow.radius,
                y: shadow.y
            )
        } else {
            fallback
        }
    }
}

private struct PromptHubVisualEffectBackground: NSViewRepresentable {
    let material: NSVisualEffectView.Material
    let blendingMode: NSVisualEffectView.BlendingMode

    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.material = material
        view.blendingMode = blendingMode
        view.state = .active
        return view
    }

    func updateNSView(_ view: NSVisualEffectView, context: Context) {
        view.material = material
        view.blendingMode = blendingMode
        view.state = .active
    }
}
