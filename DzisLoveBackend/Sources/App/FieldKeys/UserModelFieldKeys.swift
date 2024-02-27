//
//  UserModelFieldKeys.swift
//
//
//  Created by Cezar_ on 27.02.24.
//

import Vapor
import Fluent

extension UserModel {
    struct FieldKeys {
        static var username: FieldKey {
            "username"
        }
        static var email: FieldKey {
            "email"
        }
        static var password: FieldKey {
            "password"
        }
        static var role: FieldKey {
            "role"
        }
        static var subscriptionIsActiveTill: FieldKey {
            "subscriptionIsActiveTill"
        }
        static var myCourses: FieldKey {
            "myCourses"
        }
        static var bio: FieldKey {
            "bio"
        }
        static var imageUrl: FieldKey {
            "imageUrl"
        }
        static var completedCourses: FieldKey {
            "completedCourses"
        }
        static var createdAt: FieldKey {
            "createdAt"
        }
        static var updatedAt: FieldKey {
            "updatedAt"
        }
        static var lastSeen: FieldKey {
            "lastSeen"
        }
    }
}
