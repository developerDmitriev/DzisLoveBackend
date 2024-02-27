//
//  ArticleController.swiftswift
//
//
//  Created by Cezar_ on 27.02.24.
//

import Fluent
import Vapor

struct ArticleController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let articlesGroup = routes.grouped(PathComponentEnum.articles.path)
        
        articlesGroup.get("all", use: getAll)
        articlesGroup.get(use: get)
        
        //MARK: - Protect later
        articlesGroup.post(use: create)
    }
}

extension ArticleController: ContentHandlerProtocol {
    typealias answer = ArticleModel
    typealias model = ArticleModel
    typealias request = Request
    typealias status = HTTPStatus
    
    func create(_ req: Vapor.Request) async throws -> Vapor.HTTPStatus {
        let article = try req.content.decode(CreateArticleDTO.self)
        return try await ArticleServices.create(req, createDTO: article)
    }
    
    func get(_ req: Vapor.Request) async throws -> ArticleModel {
        let articleSlug = try req.query.get(String.self,at: "slug")
        return try await ArticleServices.get(req, object: articleSlug)
    }
    
    func getAll(_ req: Vapor.Request) async throws -> [ArticleModel] {
        return try await ArticleServices.getAll(req)
    }
    
    func update(_ req: Vapor.Request) async throws -> ArticleModel {
        let articleSlug = try req.query.get(String.self,at: "slug")
        let updatedArticle = try req.content.decode(UpdateArticleDTO.self)
        return try await ArticleServices.update(req, object: articleSlug, updateDTO: updatedArticle)
    }
    
    func delete(_ req: Vapor.Request) async throws -> Vapor.HTTPStatus {
        let article = req.parameters.get("slug")
        return try await ArticleServices.delete(req, object: article!)
    }
}
