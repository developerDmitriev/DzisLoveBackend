//
//  File.swift
//  
//
//  Created by Cezar_ on 27.02.24.
//

import Foundation
import Fluent
import Vapor

protocol TransformProtocol {
    associatedtype answerWithID
    
    static func getIDFromSlug(_ req: Request, slug: String) async throws -> answerWithID
}
