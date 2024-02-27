//
//  ArticleDTO.swift
//
//
//  Created by Cezar_ on 27.02.24.
//

import Vapor
import Fluent

struct CreateArticleDTO: Content {
    let title: String
    let content: String
    let headerImage: String?
    let author: UserModel.IDValue
    let status: ContentStatus.RawValue
    let price: ContentPrice.RawValue
    let type: ContentType.RawValue
    let tags: [String]
    let publishDate: Date
}

struct UpdateArticleDTO: Content {
    let title: String
    let content: String
    let headerImage: String?
    let author: UserModel.IDValue
    let status: ContentStatus.RawValue
    let price: ContentPrice.RawValue
    let type: ContentType.RawValue
    let tags: [String]
    let publishDate: Date
}
