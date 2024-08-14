//
//  Apia.swift
//  Romag
//
//  Created by Maksim on 12.08.2024.
//

struct TopNewsModel: Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [ArticlesDecodableType]?
}

struct ArticlesDecodableType: Decodable {
    let source: SourceDecodableType?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct SourceDecodableType: Decodable {
    let id: String?
    let name: String?
}
