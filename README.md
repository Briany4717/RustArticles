# Rust Articles

A SwiftUI iOS app that lists the latest Rust articles from DEV.to. Tap an article to see its details and open the full post.

## API

It uses the public DEV.to API, which needs no API key. The app makes one GET request to:

[`https://dev.to/api/articles?tag=rust&per_page=20`](https://dev.to/api/articles?tag=rust&per_page=20)

Docs: https://developers.forem.com/api/v1#tag/articles/operation/getArticles

## How to run

- **Xcode:** 27 or later
- **iOS target:** 18.6+

1. Clone the repo.
2. Open `RustArticles.xcodeproj` in Xcode.
3. Choose an iPhone simulator and press **⌘R**.

## Structure (MVVM)

- `Article.swift`: the Model.
- `ArticleViewModel.swift`: the ViewModel, which handles the GET request, the loading state and the error messages.
- `ContentView.swift`, `ArticleListItem.swift` and `ArticleDetailView.swift`: the Views, for the list and the detail screen.
