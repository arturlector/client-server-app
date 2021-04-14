//
//  WeatherService.swift
//  client-server
//
//  Created by Artur Igberdin on 11.04.2021.
//

import UIKit
import Alamofire

class WeatherService {
    
    let baseUrl = "http://api.openweathermap.org"
    
    let apiKey = "92cabe9523da26194b02974bfcd50b7e"
    
    
    func loadWeatherData(city: String) {
        
        // путь для получения погоды за 5 дней
        let path = "/data/2.5/forecast"
        // параметры, город, единицы измерения градусы, ключ для доступа к сервису
        let parameters: Parameters = [
            "q": city,
            "units": "metric",
            "appid": apiKey
        ]
        
        // составляем URL из базового адреса сервиса и конкретного пути к ресурсу
        let url = baseUrl+path
        
        // делаем запрос
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            print(repsonse.value)
        }
        
    }

    
}
