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

class Api {
    static let API_KEY = "b9a169a3d8444f95b64438004e988df6"
    static let shared = Api()
    static let news_url = "https://newsapi.org/v2/top-headlines?country=us"
        
    private init() {}
}

extension Api {
    func requestNewsData(with closure: @escaping (TopNewsModel) -> Void)
    {
        let testUrl = "\(Api.news_url)&apiKey=\(Api.API_KEY)"
        requestData(url: testUrl, with: closure)
    }
    
    func requestData(url: String, with closure: @escaping (TopNewsModel) -> Void)
    {
        AF.request(url).responseDecodable(of: TopNewsModel.self) { responce in
            do {
                try closure( responce.result.get() )
            }
            catch {
                debugPrint("ERROR while reading data")
            }
        }
    }
}

extension Api: DataInput {
    func loadData(callback: @escaping ([any Decodable]) -> Void) {
        requestNewsData( with: { result in
            guard let articles = result.articles else { return }
            callback(articles)
        } )
    
    }
    
}
