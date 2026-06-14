import SwiftUI

enum IPadScreenState<Value> {
    case loading
    case empty
    case failed(message: String)
    case loaded(Value)
}

struct IPadScreenStateScaffold<Value, Content: View>: View {
    let state: IPadScreenState<Value>
    let retry: () -> Void
    let content: (Value) -> Content

    var body: some View {
        Group {
            switch state {
            case .loading:
                ProgressView()
                    .controlSize(.large)
            case .empty:
                ContentUnavailableView(
                    "Nothing here yet",
                    systemImage: "rectangle.split.3x1",
                    description: Text("Use the sidebar, toolbar, or import action to start.")
                )
            case .failed(let message):
                ContentUnavailableView {
                    Label("Could not load", systemImage: "exclamationmark.triangle")
                } description: {
                    Text(message)
                } actions: {
                    Button("Try Again", action: retry)
                        .buttonStyle(.borderedProminent)
                }
            case .loaded(let value):
                content(value)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
