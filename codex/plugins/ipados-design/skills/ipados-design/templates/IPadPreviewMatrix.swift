import SwiftUI

struct IPadPreviewMatrix<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        Group {
            content
                .previewDisplayName("iPad Light")
                .previewInterfaceOrientation(.landscapeLeft)

            content
                .preferredColorScheme(.dark)
                .previewDisplayName("iPad Dark")
                .previewInterfaceOrientation(.landscapeLeft)

            content
                .environment(\.dynamicTypeSize, .xxxLarge)
                .previewDisplayName("Large Type")
                .previewInterfaceOrientation(.portrait)

            content
                .environment(\.dynamicTypeSize, .accessibility3)
                .previewDisplayName("Accessibility Type")
                .previewInterfaceOrientation(.portrait)

            content
                .environment(\.accessibilityContrast, .increased)
                .previewDisplayName("Increased Contrast")
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}

#Preview("iPad Matrix") {
    IPadPreviewMatrix {
        Text("Replace with the target iPad view")
            .padding()
    }
}
