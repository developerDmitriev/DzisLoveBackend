//
//  ContentProtocol.swift
//  
//
//  Created by Cezar_ on 27.02.24.
//

import Foundation
import Vapor
import Fluent

protocol ContentProtocol {
    associatedtype answer
    associatedtype model
    associatedtype request
    associatedtype status
    associatedtype createDTO
    associatedtype updateDTO
    
    static func create(_ req: request, createDTO: createDTO) async throws -> status
    static func get(_ req: request, object: String) async throws -> model
    static func getAll(_ req: request) async throws -> [model]
    static func update(_ req: request, object: String, updateDTO: updateDTO) async throws -> model
    static func delete(_ req: request, object: String) async throws -> status
}

protocol ContentHandlerProtocol {
    associatedtype answer
    associatedtype model
    associatedtype request
    associatedtype status
    
    func create(_ req: request) async throws -> status
    func get(_ req: request) async throws -> model
    func getAll(_ req: request) async throws -> [model]
    func update(_ req: request) async throws -> model
    func delete(_ req: request) async throws -> status
}
