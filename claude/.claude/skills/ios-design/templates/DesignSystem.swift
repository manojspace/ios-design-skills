import SwiftUI
import UIKit

enum AppDesign {
    enum Palette {
        static let brand = Color.dynamic(light: "#1F6F5C", dark: "#3FA98C")
        static let accent = Color.dynamic(light: "#1F6F5C", dark: "#3FA98C")

        static let bgBase = Color.dynamic(light: "#F7F5F1", dark: "#121315")
        static let bgElevated = Color.dynamic(light: "#FFFFFF", dark: "#1C1E21")
        static let bgInset = Color.dynamic(light: "#EEEBE5", dark: "#26282C")

        static let textPrimary = Color.dynamic(light: "#1B1B1F", dark: "#F4F4F6")
        static let textSecondary = Color.dynamic(light: "#5C5C66", dark: "#A8A8B3")
        static let textTertiary = Color.dynamic(light: "#9A9AA3", dark: "#6E6E78")

        static let positive = Color.dynamic(light: "#1E8E3E", dark: "#4CC675")
        static let warning = Color.dynamic(light: "#B7791F", dark: "#E2A93B")
        static let negative = Color.dynamic(light: "#C5301F", dark: "#F26B5B")
    }

    enum Fonts {
        static let display = Font.system(.largeTitle, design: .rounded).weight(.bold)
        static let title = Font.system(.title2, design: .rounded).weight(.semibold)
        static let headline = Font.system(.headline).weight(.semibold)
        static let body = Font.system(.body)
        static let caption = Font.system(.caption).weight(.medium)
        static let numeric = Font.system(.title3, design: .rounded).weight(.bold).monospacedDigit()
    }

    enum Spacing {
        static let xs: CGFloat = 4
        static let s: CGFloat = 8
        static let m: CGFloat = 12
        static let l: CGFloat = 16
        static let xl: CGFloat = 24
        static let xxl: CGFloat = 32
    }

    enum Radius {
        static let chip: CGFloat = 10
        static let button: CGFloat = 16
        static let card: CGFloat = 20
        static let sheet: CGFloat = 28
    }

    enum Shadow {
        static let card = Color.black.opacity(0.05)
    }
}

extension UIColor {
    convenience init(hex: String) {
        var value: UInt64 = 0
        var hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if hex.hasPrefix("#") {
            hex.removeFirst()
        }
        Scanner(string: hex).scanHexInt64(&value)
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255,
            green: CGFloat((value & 0x00FF00) >> 8) / 255,
            blue: CGFloat(value & 0x0000FF) / 255,
            alpha: 1
        )
    }
}

extension Color {
    static func dynamic(light: String, dark: String) -> Color {
        Color(UIColor { trait in
            trait.userInterfaceStyle == .dark ? UIColor(hex: dark) : UIColor(hex: light)
        })
    }
}

extension View {
    func appCardSurface() -> some View {
        padding(AppDesign.Spacing.l)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                AppDesign.Palette.bgElevated,
                in: .rect(cornerRadius: AppDesign.Radius.card, style: .continuous)
            )
            .shadow(color: AppDesign.Shadow.card, radius: 14, y: 3)
    }
}

struct AppPrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AppDesign.Fonts.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, minHeight: 52)
            .background(
                AppDesign.Palette.accent,
                in: .rect(cornerRadius: AppDesign.Radius.button, style: .continuous)
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .opacity(configuration.isPressed ? 0.9 : 1)
            .animation(.spring(response: 0.25, dampingFraction: 0.7), value: configuration.isPressed)
    }
}

struct AppSecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AppDesign.Fonts.headline)
            .foregroundStyle(AppDesign.Palette.accent)
            .frame(maxWidth: .infinity, minHeight: 52)
            .background(
                AppDesign.Palette.accent.opacity(0.12),
                in: .rect(cornerRadius: AppDesign.Radius.button, style: .continuous)
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .animation(.spring(response: 0.25, dampingFraction: 0.7), value: configuration.isPressed)
    }
}
