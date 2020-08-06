//
//  TrendingInteractor.swift
//  GithubToday
//
//  Created by Indra Tirta Nugraha on 06/08/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import Foundation
import Alamofire

class TrendingInteractor: TrendingPresenterToInteractor {
    var presenter: TrendingInteractorToPresenter?
    let URL_TRENDING_REPOS = "https://ghapi.huchen.dev/repositories"
    let URL_TRENDING_DEVS = "https://ghapi.huchen.dev/developers"
    
    func fetchingTrendingRepositories() {
        AF.request(URL_TRENDING_REPOS, method: .get).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let jsonDecoder = JSONDecoder()
                    if let data = response.data {
                        let repositories = try jsonDecoder.decode([TrendingRepository].self, from: data)
                        self.presenter?.didFetchTrendingRepositories(repositories)
                    } else {
                        self.presenter?.didError("Error when parse response: trending_repositories")
                    }
                } catch let error {
                    self.presenter?.didError(error.localizedDescription)
                }
            case .failure(let error):
                self.presenter?.didError(error.localizedDescription)
            }
        }
    }
    
    func fetchingTrendingDevelopers() {
        AF.request(URL_TRENDING_DEVS, method: .get).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let jsonDecoder = JSONDecoder()
                    if let data = response.data {
                        let developers = try jsonDecoder.decode([TrendingDevelopers].self, from: data)
                        self.presenter?.didFetchTrendingDevelopers(developers)
                    } else {
                        self.presenter?.didError("Error when parse response: trending_developers")
                    }
                } catch let error {
                    self.presenter?.didError(error.localizedDescription)
                }
            case .failure(let error):
                self.presenter?.didError(error.localizedDescription)
            }
        }
    }
}
