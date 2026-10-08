import SwiftUI

struct ContentView: View {
    @State var articleVM = ArticleViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(articleVM.articles) { article in
                        NavigationLink {
                            ArticleDetailView(article: article)
                        } label: {
                            ArticleListItem(article: article)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .frame(width: 400)
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Rust Articles")
            .overlay { statusOverlay }
            .task { await articleVM.getRustArticles() }
        }
    }

    @ViewBuilder
    private var statusOverlay: some View {
        if articleVM.isLoading {
            ProgressView("Cargando Articulos…")
        } else if let message = articleVM.errorMessage {
            ContentUnavailableView {
                Label("Algo anda mal", systemImage: "wifi.exclamationmark")
            } description: {
                Text(message)
            } actions: {
                Button("Volver a intentar") {
                    Task { await articleVM.getRustArticles() }
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    ContentView()
}
