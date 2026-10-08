//
//  Article.swift
//  RustArticles
//
//  Created by Brian Roberto Gómez Martínez on 07/10/26.
//

import Foundation


struct Article: Identifiable, Decodable {
    var id: Int
    var title: String
    var description: String
    var link: String
    var coverImage: String?
    var socialImage: String?
    var readablePublishDate: String
    var readingTimeMinutes: Int
    var tagList: [String]
    var user: Author
    var imageURL: URL? { URL(string: coverImage ?? socialImage ?? "") }

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case link = "url"
        case coverImage = "cover_image"
        case socialImage = "social_image"
        case readablePublishDate = "readable_publish_date"
        case readingTimeMinutes = "reading_time_minutes"
        case tagList = "tag_list"
        case user
    }

}

struct Author: Decodable {
    var name: String
    var profileImage: String?

    enum CodingKeys: String, CodingKey {
        case name
        case profileImage = "profile_image_90"
    }
}

