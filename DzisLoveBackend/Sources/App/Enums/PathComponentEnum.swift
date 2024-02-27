//
//  PathComponentEnum.swift
//
//
//  Created by Cezar_ on 27.02.24.
//

import Fluent
import Vapor

enum PathComponentEnum: String {
    case auth
    case articles
    case users
    
    var path: PathComponent {
        switch self {
        default:
            PathComponent(stringLiteral: self.rawValue)
        }
    }
}
