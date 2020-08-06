//
//  TrendingPresenter.swift
//  GithubToday
//
//  Created by Indra Tirta Nugraha on 06/08/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import UIKit

class TrendingPresenter: TrendingViewToPresenter {
    var view: TrendingPresenterToView?
    
    var interactor: TrendingPresenterToInteractor?
    
    var router: TrendingPresenterToRouter?
    
    func fetchTrendingRepositories() {
        interactor?.fetchingTrendingRepositories()
    }
    
    func fetchTrendingDevelopers() {
        interactor?.fetchingTrendingDevelopers()
    }
    
    func showDetailVC(navigationController: UINavigationController) {
        router?.presentToDetail(navigationController: navigationController)
    }
}

extension TrendingPresenter: TrendingInteractorToPresenter {
    func didFetchTrendingRepositories(_ repositories: [TrendingRepository]) {
        view?.showTrendingRepositories(repositories)
    }
    
    func didFetchTrendingDevelopers(_ developers: [TrendingDevelopers]) {
        view?.showTrendingDevelopers(developers)
    }
    
    func didError(_ message: String) {
        view?.showError(message)
    }
}
