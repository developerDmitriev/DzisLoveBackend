//
//  ArticleServices.swift
//
//
//  Created by Cezar_ on 27.02.24.
//

import Foundation
import Vapor
import Fluent

struct ArticleServices: ContentProtocol {
    typealias answer = ArticleModel
    typealias model = ArticleModel
    typealias request = Request
    typealias status = HTTPStatus
    typealias createDTO = CreateArticleDTO
    typealias updateDTO = UpdateArticleDTO
    
    static func create(_ req: Vapor.Request, createDTO: CreateArticleDTO) async throws -> Vapor.HTTPStatus {
        let slug = createDTO.title.replacingOccurrences(of: " ", with: "-")
        
        let article = ArticleModel(title: createDTO.title,
                                   slug: slug,
                                   content: createDTO.content,
                                   headerImage: createDTO.headerImage,
                                   author: createDTO.author,
                                   status: createDTO.status,
                                   price: createDTO.price,
                                   type: createDTO.type,
                                   tags: createDTO.tags,
                                   viewCount: 0,
                                   createdAt: Date(),
                                   updatedAt: Date(),
                                   publishDate: createDTO.publishDate)
        try await article.save(on: req.db)
        return .ok
    }
    
    static func get(_ req: Vapor.Request, object: String) async throws -> ArticleModel {
        guard let article = try await ArticleModel.query(on: req.db)
            .filter(\.$slug == object)
            .first() else {
            throw Abort(.notFound, reason: "Couldn't find article with slug of \(object)")
        }
        article.viewCount += 1
        return article
    }
    
    static func getAll(_ req: Vapor.Request) async throws -> [ArticleModel] {
        return try await ArticleModel.query(on: req.db)
            .all()
    }
    
    static func update(_ req: Vapor.Request, object: String, updateDTO: UpdateArticleDTO) async throws -> ArticleModel {
        let uuid = try await getIDFromSlug(req, slug: object)
        guard let article = try await ArticleModel.find(uuid, on: req.db) else {
            throw Abort(.notFound, reason: "Couldn't find article with slug of \(object)")
        }
        let slug = updateDTO.title.replacingOccurrences(of: " ", with: "-")
        
        article.title = updateDTO.title
        article.slug = slug
        article.content = updateDTO.content
        article.headerImage = updateDTO.headerImage
        article.status = updateDTO.status
        article.price = updateDTO.price
        article.type = updateDTO.type
        article.tags = updateDTO.tags
        article.publishDate = updateDTO.publishDate
        
        try await article.save(on: req.db)
        return article
    }
    
    static func delete(_ req: Vapor.Request, object: String) async throws -> Vapor.HTTPStatus {
        let uuid = try await getIDFromSlug(req, slug: object)
        guard let article = try await ArticleModel.find(uuid, on: req.db) else {
            throw Abort(.notFound, reason: "Couldn't find article with slug of \(object)")
        }
        try await article.delete(on: req.db)
        return .ok
    }
}

extension ArticleServices: TransformProtocol {
    typealias answerWithID = UUID
    
    static func getIDFromSlug(_ req: Vapor.Request, slug: String) async throws -> UUID {
        guard let article = try await ArticleModel.query(on: req.db)
            .filter(\.$slug == slug)
            .first() else {
            throw Abort(.notFound, reason: "Couldn't find article with slug of \(slug)")
        }
        return article.id!
    }
}
