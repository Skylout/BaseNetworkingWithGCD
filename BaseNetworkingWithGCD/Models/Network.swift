//
//  Network.swift
//  BaseNetworkingWithGCD
//
//  Created by Леонид on 17.06.2021.
//

import Foundation
import Alamofire

class Network {
    let dogeURL = "https://i.kym-cdn.com/entries/icons/original/000/013/564/doge.jpg"
    let kittyURL = "https://i.redd.it/cw5086iyixm51.jpg"
    
    //использование escaping closure небезопасно в некоторых случаях
    func getImageByURLSession (completion: @escaping (_ image: UIImage)->()) {
        //создание URL из строки для последующего использования в dataTask-e
        guard let url = URL(string: kittyURL) else { return }
        //создание синглтона для создания запроса
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
                    completion(image)
                })
            }
        }.resume()
    }
    //скачивать картинки при помощи Alamofire идея, конечно, так себе, но здесь это реализуется чисто в образовательных целях
    func getImageByAlamofire (completion: @escaping (_ image: UIImage)->()) {
        //создание URL из строки для последующего использования в dataTask-e
        guard let url = URL(string: dogeURL) else { return }
        AF.request(url).responseData { (responseData) in
            switch responseData.result {
            
            case .success(let data):
                guard let image = UIImage(data: data) else { return }
                DispatchQueue.main.async {
                    completion(image)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
