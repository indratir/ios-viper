//
//  TrendingProtocol.swift
//  GithubToday
//
//  Created by Indra Tirta Nugraha on 06/08/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//
import UIKit

protocol TrendingViewToPresenter: AnyObject {
    var view: TrendingPresenterToView? {get set}
    var interactor: TrendingPresenterToInteractor? {get set}
    var router: TrendingPresenterToRouter? {get set}
    func fetchTrendingRepositories()
    func fetchTrendingDevelopers()
    func showDetailVC(navigationController: UINavigationController)
}

protocol TrendingPresenterToView: AnyObject {
    var presenter: TrendingViewToPresenter? {get set}
    func showTrendingRepositories(_ repositories: [TrendingRepository])
    func showTrendingDevelopers(_ developers: [TrendingDevelopers])
    func showError(_ message: String)
}

protocol TrendingPresenterToRouter: AnyObject {
    static func createModule() -> TrendingVC
    func presentToDetail(navigationController: UINavigationController)
}

protocol TrendingPresenterToInteractor: AnyObject {
    var presenter: TrendingInteractorToPresenter? {get set}
    func fetchingTrendingRepositories()
    func fetchingTrendingDevelopers()
}

protocol TrendingInteractorToPresenter: AnyObject {
    func didFetchTrendingRepositories(_ repositories: [TrendingRepository])
    func didFetchTrendingDevelopers(_ developers: [TrendingDevelopers])
    func didError(_ message: String)
}
