//
//  TrendingRouter.swift
//  GithubToday
//
//  Created by Indra Tirta Nugraha on 06/08/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import UIKit

class TrendingRouter: TrendingPresenterToRouter {
    
    static func createModule() -> TrendingVC {
        let viewController = TrendingVC()
        let presenter: TrendingViewToPresenter & TrendingInteractorToPresenter = TrendingPresenter()
        let interactor: TrendingPresenterToInteractor = TrendingInteractor()
        let router: TrendingPresenterToRouter = TrendingRouter()
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        return viewController
    }
    
    func presentToDetail(navigationController: UINavigationController) {
        let alert = UIAlertController(title: nil, message: "Detail Page is coming soon!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        navigationController.present(alert, animated: true)
    }
}
