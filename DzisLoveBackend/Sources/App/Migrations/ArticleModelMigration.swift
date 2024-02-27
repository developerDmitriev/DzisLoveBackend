//
//  ArticleModelMigration.swift
//
//
//  Created by Cezar_ on 27.02.24.
//

import Foundation
import Fluent
import Vapor

struct ArticleModelMigration: AsyncMigration {
    let schema = ArticleModel.schema.self
    let keys = ArticleModel.FieldKeys.self
    
    func prepare(on database: Database) async throws {
        try await database.schema(schema)
            .id()
            .field(keys.title, .string)
            .field(keys.slug, .string)
            .field(keys.content, .string)
            .field(keys.headerImage, .string)
            .field(keys.author, .uuid)
            .field(keys.status, .string)
            .field(keys.price, .string)
            .field(keys.type, .string)
            .field(keys.tags, .array(of: .string))
            .field(keys.viewCount, .int8)
            .field(keys.createdAt, .datetime)
            .field(keys.updatedAt, .datetime)
            .field(keys.publishDate, .datetime)
            .unique(on: keys.slug)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(schema).delete() 
    }
}
