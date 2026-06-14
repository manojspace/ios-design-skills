import SwiftUI

struct IPadAdaptiveScaffold<Sidebar: View, Content: View, Inspector: View>: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    let sidebar: Sidebar
    let content: Content
    let inspector: Inspector

    init(
        @ViewBuilder sidebar: () -> Sidebar,
        @ViewBuilder content: () -> Content,
        @ViewBuilder inspector: () -> Inspector
    ) {
        self.sidebar = sidebar()
        self.content = content()
        self.inspector = inspector()
    }

    var body: some View {
        if horizontalSizeClass == .compact {
            NavigationStack {
                content
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Menu {
                                sidebar
                            } label: {
                                Label("Navigation", systemImage: "sidebar.left")
                            }
                        }
                    }
            }
        } else {
            NavigationSplitView {
                sidebar
                    .navigationTitle("Browse")
            } content: {
                content
                    .navigationTitle("Content")
            } detail: {
                inspector
                    .navigationTitle("Details")
            }
        }
    }
}
