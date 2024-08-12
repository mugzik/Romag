//
//  Api.swift
//  Romag
//
//  Created by Maksim on 12.08.2024.
//

import Foundation
import Alamofire

// 1) Получить данные с сайта https://newsapi.org/
// 2) Запихать в структуру

struct DecodableType: Decodable {
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

class Api {
    static let shared = Api()
    
    private init() {}
}

extension Api {
    func getSimpleData()
    {
        let testUrl = "https://newsapi.org/v2/top-headlines?country=us&apiKey=b9a169a3d8444f95b64438004e988df6"
        getData(url: testUrl)
    }
    
    func getData(url: String)
    {
        var a = AF.request(url).responseDecodable(of: DecodableType.self) { resp in
            debugPrint(resp)
        }
        AF.request(url).responseData { r in
            do {
                var a = try JSONDecoder().decode(DecodableType.self, from: r.data!)
                debugPrint(a)
            } catch let err {
                print(err.localizedDescription)
            }
        }
    }
}
