import SwiftUI

struct AppPreviewMatrix<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        Group {
            content
                .previewDisplayName("Light")

            content
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark")

            content
                .environment(\.dynamicTypeSize, .xxxLarge)
                .previewDisplayName("Large Type")

            content
                .environment(\.dynamicTypeSize, .accessibility3)
                .previewDisplayName("Accessibility Type")

            content
                .environment(\.accessibilityContrast, .increased)
                .previewDisplayName("Increased Contrast")
        }
    }
}

#Preview("Matrix") {
    AppPreviewMatrix {
        Text("Replace with the target view")
            .font(AppDesign.Fonts.title)
            .padding(AppDesign.Spacing.l)
            .foregroundStyle(AppDesign.Palette.textPrimary)
            .background(AppDesign.Palette.bgBase)
    }
}
