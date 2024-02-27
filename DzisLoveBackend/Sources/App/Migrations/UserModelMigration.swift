//
//  UserModelMigration.swift
//
//
//  Created by Cezar_ on 27.02.24.
//

import Foundation
import Fluent
import Vapor

struct UserModelMigration: AsyncMigration {
    let schema = UserModel.schema.self
    let keys = UserModel.FieldKeys.self
    
    func prepare(on database: Database) async throws {
        try await database.schema(schema)
            .id()
            .field(keys.username, .string)
            .field(keys.email, .string)
            .field(keys.password, .string)
            .field(keys.role, .string)
            .field(keys.subscriptionIsActiveTill, .datetime)
            .field(keys.myCourses, .array(of: .uuid))
            .field(keys.bio, .string)
            .field(keys.imageUrl, .string)
            .field(keys.completedCourses, .array(of: .uuid))
            .field(keys.createdAt, .datetime)
            .field(keys.updatedAt, .datetime)
            .field(keys.lastSeen, .datetime)
            .unique(on: keys.email)
            .unique(on: keys.username)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(schema).delete()
    }
}
