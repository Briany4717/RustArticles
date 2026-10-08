//
//  ArticleDetailView.swift
//  RustArticles
//
//  Created by Brian Roberto Gómez Martínez on 07/10/26.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: article.imageURL) { img in
                    img.resizable().scaledToFit()
                } placeholder: {
                    ProgressView().frame(maxWidth: .infinity, minHeight: 150)
                }
                .clipShape(.rect(cornerRadius: 16))

                Text(article.title)
                    .font(.title2.bold())

                Text("By \(article.user.name) \(article.readablePublishDate) - \(article.readingTimeMinutes) min read")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text(article.description)

                if let url = URL(string: article.link) {
                    Link("Read full article", destination: url)
                        .buttonStyle(.borderedProminent)
                }
            }
            .padding()
        }
        .navigationTitle("Article")
        .navigationBarTitleDisplayMode(.inline)
    }
}
