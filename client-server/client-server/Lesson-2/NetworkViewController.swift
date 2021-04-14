//
//  NetworkViewController.swift
//  client-server
//
//  Created by Artur Igberdin on 11.04.2021.
//

import UIKit
import Alamofire

class NetworkViewController: UIViewController {

    private let weatherService = WeatherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //URLRequest with URLSession
        //firstRequest()
        
        //Alamofire
        //secondRequest()
        
        //thirdRequest()
    }
    
    func thirdRequest() {
        weatherService.loadWeatherData(city: "Moscow")
    }
    
    func secondRequest() {
        
        Alamofire
            .request("http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1")
            .responseJSON { response in
                    
            print(response.value)
        }
    }
    
    func firstRequest() {
        
        // создаем URL из строки
        //let url = URL(string: "http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1")
        
        // создаем конструктор для url
        var urlConstructor = URLComponents()
        // устанавливаем схему
        urlConstructor.scheme = "http"
        // устанавливаем хост
        urlConstructor.host = "jsonplaceholder.typicode.com"
        // путь
        urlConstructor.path = "/posts"
        // параметры для запроса
        urlConstructor.queryItems = [
            URLQueryItem(name: "title", value: "foo"),
            URLQueryItem(name: "body", value: "bar"),
            URLQueryItem(name: "userId", value: "1")
        ]

        // Конфигурация по умолчанию
        let configuration = URLSessionConfiguration.default
        let session =  URLSession(configuration: configuration)
        
        // создаем запрос
        var request = URLRequest(url: urlConstructor.url!)
        // указываем метод
        request.httpMethod = "POST"
           
        let task = session.dataTask(with: request) { (data, response, error) in
            
            // Data -> Dictionary/Array
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            //print(json)
        }
        
        task.resume()
    }

}
