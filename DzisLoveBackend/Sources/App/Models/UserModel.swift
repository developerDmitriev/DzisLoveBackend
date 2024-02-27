//
//  UserModel.swift
//
//
//  Created by Cezar_ on 27.02.24.
//

import Vapor
import Fluent

final class UserModel: Model {
    static var schema: String = Schema.users.rawValue
    
    @ID
    var id: UUID?
    
    @OptionalField(key: FieldKeys.username)
    var username: String?
    
    @Field(key: FieldKeys.email)
    var email: String
    
    @Field(key: FieldKeys.password)
    var password: String
    
    @Field(key: FieldKeys.role)
    var role: UserRoleEnum.RawValue
    
    @OptionalField(key: FieldKeys.subscriptionIsActiveTill)
    var subscriptionIsActiveTill: Date?
    
    @OptionalField(key: FieldKeys.myCourses)
    var myCourses: [UUID]?
    
    @OptionalField(key: FieldKeys.bio)
    var bio: String?
    
    @OptionalField(key: FieldKeys.imageUrl)
    var imageUrl: String?
    
    @OptionalField(key: FieldKeys.completedCourses)
    var completedCourses: [UUID]?
    
    @Timestamp(key: FieldKeys.createdAt, on: .create)
    var createdAt: Date?
    
    @Timestamp(key: FieldKeys.updatedAt, on: .create)
    var updatedAt: Date?
    
    @Timestamp(key: FieldKeys.lastSeen, on: .none)
    var lastSeen: Date?
    
    init(username: String?, email: String, password: String, role: UserRoleEnum.RawValue, createdAt: Date?, updatedAt: Date?, lastSeen: Date?) {
        self.username = username
        self.email = email
        self.password = password
        self.role = role
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.lastSeen = lastSeen
    }
    
    init(username: String?, email: String, password: String, role: UserRoleEnum.RawValue, subscriptionIsActiveTill: Date?, myCourses: [UUID]?, bio: String?, imageUrl: String?, completedCourses: [UUID]?, createdAt: Date?, updatedAt: Date?, lastSeen: Date?) {
        self.username = username
        self.email = email
        self.password = password
        self.role = role
        self.subscriptionIsActiveTill = subscriptionIsActiveTill
        self.myCourses = myCourses
        self.bio = bio
        self.imageUrl = imageUrl
        self.completedCourses = completedCourses
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.lastSeen = lastSeen
    }
    
    init(subscriptionIsActiveTill: Date?) {
        self.subscriptionIsActiveTill = subscriptionIsActiveTill
    }
    
    init(myCourses: [UUID]?) {
        self.myCourses = myCourses
    }
    
    init(completedCourses: [UUID]?) {
        self.completedCourses = completedCourses
    }
    
    init(lastSeen: Date?) {
        self.lastSeen = lastSeen
    }
    
    init(role: UserRoleEnum.RawValue) {
        self.role = role
    }
    
    init() {
    }
}

extension UserModel {
    func isAdmin() -> Bool {
        return self.role == UserRoleEnum.admin.rawValue
    }
}

extension UserModel: Content {
}

extension UserModel:Authenticatable {}

extension UserModel: ModelAuthenticatable {
    static let usernameKey = \UserModel.$email
    static let passwordHashKey = \UserModel.$password
    
    func verify(password: String) throws -> Bool {
        try Bcrypt.verify(password, created: self.password)
    }
}
extension UserModel: ModelSessionAuthenticatable {}
extension UserModel: ModelCredentialsAuthenticatable {}
