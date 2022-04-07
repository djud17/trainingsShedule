//
//  ApiClientImpl.swift
//  test_fitness
//
//  Created by Давид Тоноян  on 02.04.2022.
//

import Alamofire

enum ApiError: Error {
    case noData
    case wrongAnswer
}

protocol ApiClient {
    func getTableTrain(completion: @escaping (Result<Trainings, Error>) -> Void)
}

class ApiClientImpl: ApiClient {
    private let url = URL(string: "https://olimpia.fitnesskit-admin.ru/schedule/get_v3/?club_id=2")!
    
    func getTableTrain(completion: @escaping (Result<Trainings, Error>) -> Void) {
        AF.request(url).responseData { response in
            if let data = response.value {
                let trainings: Trainings = try! JSONDecoder().decode(Trainings.self, from: data)
                if response.response?.statusCode == 200 {
                    completion(.success(trainings))
                } else {
                    completion(.failure(ApiError.wrongAnswer))
                }
            } else {
                completion(.failure(ApiError.noData))
            }
        }
    }
}
