//
//  ArticleModelFieldKeys.swift
//
//
//  Created by Cezar_ on 27.02.24.
//

import Fluent
import Vapor

extension ArticleModel {
    struct FieldKeys {
        static var title: FieldKey {
            "title"
        }
        static var slug: FieldKey {
            "slug"
        }
        static var content: FieldKey {
            "content"
        }
        static var headerImage: FieldKey {
            "headerImage"
        }
        static var author: FieldKey {
            "author"
        }
        static var status: FieldKey {
            "status"
        }
        static var price: FieldKey {
            "price"
        }
        static var type: FieldKey {
            "type"
        }
        static var tags: FieldKey {
            "tags"
        }
        static var viewCount: FieldKey {
            "viewCount"
        }
        static var createdAt: FieldKey {
            "createdAt"
        }
        static var updatedAt: FieldKey {
            "updatedAt"
        }
        static var publishDate: FieldKey {
            "publishDate"
        }
    }
}
