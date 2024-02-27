//
//  AuthProtocol.swift
//  
//
//  Created by Cezar_ on 27.02.24.
//

import Foundation
import Vapor
import Fluent

protocol AuthProtocol {
    func loginHandler(_ req: Request) throws -> EventLoopFuture<TokenModel>
}
