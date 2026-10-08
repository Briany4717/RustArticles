//
//  ArticleListItem.swift
//  RustArticles
//
//  Created by Brian Roberto Gómez Martínez on 07/10/26.
//

import Foundation
import SwiftUI

struct ArticleListItem: View {
    let article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            cover

            VStack(alignment: .leading, spacing: 10) {
                Text(article.title)
                    .font(.headline)
                    .multilineTextAlignment(.leading)

                Text(article.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)

                authorSection
            }
            .padding(14)
        }
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(.rect(cornerRadius: 16))
        .shadow(color: .black.opacity(0.08), radius: 8, y: 4)
    }

    private var cover: some View {
        Color(.secondarySystemFill)
            .aspectRatio(1000 / 420, contentMode: .fit)
            .overlay {
                AsyncImage(url: article.imageURL, transaction: Transaction(animation: .easeOut)) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable().scaledToFill()
                    case .failure:
                        Image(systemName: "photo")
                            .font(.title)
                            .foregroundStyle(.tertiary)
                    default:
                        ProgressView()
                    }
                }
            }
            .clipped()
    }

    private var authorSection: some View {
        HStack(spacing: 8) {
            AsyncImage(url: URL(string: article.user.profileImage ?? "")) { img in
                img.resizable().scaledToFill()
            } placeholder: {
                Circle().fill(.quaternary)
            }
            .frame(width: 28, height: 28)
            .clipShape(.circle)

            VStack(alignment: .leading, spacing: 0) {
                Text(article.user.name)
                    .font(.caption.weight(.semibold))
                Text(article.readablePublishDate)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Label("\(article.readingTimeMinutes) min", systemImage: "clock")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}
