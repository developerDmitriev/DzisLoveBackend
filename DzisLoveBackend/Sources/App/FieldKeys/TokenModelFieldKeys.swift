//
//  TokenModelFieldKeys.swift
//
//
//  Created by Cezar_ on 27.02.24.
//

import Fluent
import Vapor

extension TokenModel {
    struct FieldKeys {
        static var value: FieldKey {
            "value"
        }
        static var userID: FieldKey {
            "userID"
        }
    }
}
