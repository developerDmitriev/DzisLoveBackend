//
//  TokenModelMigation.swift
//  
//
//  Created by Cezar_ on 27.02.24.
//

import Foundation
import Fluent
import Vapor


struct TokenModelMigration: AsyncMigration {
    let keys = TokenModel.FieldKeys.self
    let schema = TokenModel.schema.self
    
    func prepare(on database: FluentKit.Database) async throws {
        try await database.schema(schema)
            .id()
            .field(keys.value, .string)
            .field(keys.userID, .uuid)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(schema).delete()
    }
}
