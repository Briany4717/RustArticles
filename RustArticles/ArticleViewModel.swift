//
//  ArticleViewModel.swift
//  RustArticles
//
//  Created by Brian Roberto Gómez Martínez on 07/10/26.
//

import Foundation
import Playgrounds

@Observable
@MainActor
class ArticleViewModel {
    var articles = [Article]()
    var isLoading = false
    var errorMessage: String?

    func getRustArticles() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        guard let url = URL(string: "https://dev.to/api/articles?tag=rust&per_page=20") else {
            errorMessage = "URL Invalida"
            return
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            guard statusCode == 200 else {
                errorMessage = "Error del servidor (status \(statusCode)). Vuelva a intentar"
                return
            }

            articles = try JSONDecoder().decode([Article].self, from: data)
        } catch let error as URLError where [.notConnectedToInternet, .networkConnectionLost].contains(error.code) {
            errorMessage = "Sin conexión. Vuelva a intentar"
        } catch {
            errorMessage = "No se pueden cargar los artículos: \(error.localizedDescription)"
        }
    }
}

