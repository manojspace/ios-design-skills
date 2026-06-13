import SwiftUI

enum ScreenLoadState<Value> {
    case loading
    case empty
    case failed(message: String)
    case loaded(Value)
}

struct ScreenStateScaffold<Value, Content: View>: View {
    let state: ScreenLoadState<Value>
    let retry: () -> Void
    let content: (Value) -> Content

    var body: some View {
        Group {
            switch state {
            case .loading:
                loadingView
            case .empty:
                emptyView
            case .failed(let message):
                errorView(message: message)
            case .loaded(let value):
                content(value)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppDesign.Palette.bgBase)
    }

    private var loadingView: some View {
        VStack(spacing: AppDesign.Spacing.m) {
            RoundedRectangle(cornerRadius: AppDesign.Radius.card, style: .continuous)
                .fill(AppDesign.Palette.bgInset)
                .frame(height: 120)
            RoundedRectangle(cornerRadius: AppDesign.Radius.card, style: .continuous)
                .fill(AppDesign.Palette.bgInset)
                .frame(height: 88)
        }
        .padding(AppDesign.Spacing.l)
        .redacted(reason: .placeholder)
        .accessibilityLabel("Loading")
    }

    private var emptyView: some View {
        VStack(spacing: AppDesign.Spacing.l) {
            Image(systemName: "tray")
                .font(.system(size: 42, weight: .light))
                .foregroundStyle(AppDesign.Palette.accent)
            VStack(spacing: AppDesign.Spacing.xs) {
                Text("Nothing here yet")
                    .font(AppDesign.Fonts.title)
                    .foregroundStyle(AppDesign.Palette.textPrimary)
                Text("Add the first item to get started.")
                    .font(AppDesign.Fonts.body)
                    .foregroundStyle(AppDesign.Palette.textSecondary)
                    .multilineTextAlignment(.center)
            }
        }
        .padding(AppDesign.Spacing.xl)
    }

    private func errorView(message: String) -> some View {
        VStack(spacing: AppDesign.Spacing.l) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 38, weight: .regular))
                .foregroundStyle(AppDesign.Palette.warning)
            VStack(spacing: AppDesign.Spacing.xs) {
                Text("Could not load")
                    .font(AppDesign.Fonts.title)
                    .foregroundStyle(AppDesign.Palette.textPrimary)
                Text(message)
                    .font(AppDesign.Fonts.body)
                    .foregroundStyle(AppDesign.Palette.textSecondary)
                    .multilineTextAlignment(.center)
            }
            Button("Try again", action: retry)
                .buttonStyle(AppPrimaryButtonStyle())
        }
        .padding(AppDesign.Spacing.xl)
    }
}
