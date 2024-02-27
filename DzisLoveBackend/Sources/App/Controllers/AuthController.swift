//
//  AuthController
//
//
//  Created by Cezar_ on 27.02.24.
//

import Fluent
import Vapor

struct AuthController: RouteCollection, AuthProtocol {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let authGroup = routes.grouped(PathComponentEnum.auth.path)
        
        let basicMiddleWare = UserModel.authenticator()
        let basic = authGroup.grouped(basicMiddleWare)
        
        basic.post(use: loginHandler)
    }
    
    func loginHandler(_ req: Vapor.Request) throws -> NIOCore.EventLoopFuture<TokenModel> {
        let user = try req.auth.require(UserModel.self)
        let token = try TokenModel.generate(for: user)
        
        return token.save(on: req.db)
            .flatMapError { error in
                print("Error in loginHandler: \(String(reflecting: error))")
                return req.eventLoop.makeFailedFuture(MyCustomError(String(reflecting: error)))
            }
            .map {
                token
            }
    }
}

struct MyCustomError: Error {
    let reason: String

    init(_ reason: String) {
        self.reason = reason
    }
}

