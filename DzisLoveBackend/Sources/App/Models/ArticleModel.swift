//
//  ArticleModel.swift
//
//
//  Created by Cezar_ on 27.02.24.
//

import Fluent
import Vapor

final class ArticleModel: Model {
    static let schema: String = Schema.articles.rawValue
    
    @ID
    var id: UUID?
    
    @Field(key: FieldKeys.title)
    var title: String
    
    @Field(key: FieldKeys.slug)
    var slug: String
    
    @Field(key: FieldKeys.content)
    var content: String
    
    @OptionalField(key: FieldKeys.headerImage)
    var headerImage: String?
    
    @Field(key: FieldKeys.author)
    var author: UserModel.IDValue
    
    @Field(key: FieldKeys.status)
    var status: ContentStatus.RawValue
    
    @Field(key: FieldKeys.price)
    var price: ContentPrice.RawValue
    
    @Field(key: FieldKeys.type)
    var type: ContentType.RawValue
    
    @Field(key: FieldKeys.tags)
    var tags: [String]
    
    @Field(key: FieldKeys.viewCount)
    var viewCount: Int
    
    @Timestamp(key: FieldKeys.createdAt, on: .create)
    var createdAt: Date?
    
    @Timestamp(key: FieldKeys.updatedAt, on: .create)
    var updatedAt: Date?
    
    @Field(key: FieldKeys.publishDate)
    var publishDate: Date
    
    init(title: String, slug: String, content: String, headerImage: String?, author: UserModel.IDValue, status: ContentStatus.RawValue, price: ContentPrice.RawValue, type: ContentType.RawValue, tags: [String], viewCount: Int, createdAt: Date?, updatedAt: Date?, publishDate: Date) {
        self.id = id
        self.title = title
        self.slug = slug
        self.content = content
        self.headerImage = headerImage
        self.author = author
        self.status = status
        self.price = price
        self.type = type
        self.tags = tags
        self.viewCount = viewCount
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.publishDate = publishDate
    }
    
    init() {
    }
    
    init(status: ContentStatus.RawValue) {
        self.status = status
    }
    
    init(price: ContentPrice.RawValue) {
        self.price = price
    }
    
    init(tags: [String]) {
        self.tags = tags
    }
    
    init(title: String, slug: String, content: String, headerImage: String?) {
        self.id = id
        self.title = title
        self.slug = slug
        self.content = content
        self.headerImage = headerImage
    }
}

extension ArticleModel: Content {
}
