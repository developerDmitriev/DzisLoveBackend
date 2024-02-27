//
//  CheckAdminMiddleware.swift
//
//
//  Created by Cezar_ on 27.02.24.
//

import Vapor
import Fluent

struct CheckAdminMiddleware: AsyncMiddleware {
    func respond(to request: Vapor.Request, chainingTo next: Vapor.AsyncResponder) async throws -> Vapor.Response {
        guard let user = request.auth.get(UserModel.self), user.isAdmin() else {
            throw Abort(.forbidden, reason: "Sorry, it is for Admins")
        }
        return try await next.respond(to: request)
    }
}
