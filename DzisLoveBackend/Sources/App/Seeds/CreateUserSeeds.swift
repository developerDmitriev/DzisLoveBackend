//
//  CreateUserSeeds.swift
//
//
//  Created by Cezar_ on 27.02.24.
//

import Vapor
import Fluent

struct CreateUserSeeds: AsyncMigration {
    func prepare(on database: Database) async throws {
        let admin = UserModel(username: "DzisLove",
                              email: "vladdmitrievdev@gmail.com",
                              password: try Bcrypt.hash("12345678"),
                              role: UserRoleEnum.admin.rawValue,
                              subscriptionIsActiveTill: nil,
                              myCourses: nil,
                              bio: "Father",
                              imageUrl: "https://avatars.githubusercontent.com/u/154912778?v=4",
                              completedCourses: nil,
                              createdAt: Date(),
                              updatedAt: Date(),
                              lastSeen: Date())
        try await admin.create(on: database)
    }
    
    func revert(on database: Database) async throws {
        try await UserModel.query(on: database).delete()
    }
}
