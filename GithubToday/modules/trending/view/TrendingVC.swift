//
//  TrendingVC.swift
//  GithubToday
//
//  Created by Indra Tirta Nugraha on 06/08/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import UIKit

class TrendingVC: UIViewController, TrendingPresenterToView {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: TrendingViewToPresenter?
    var repositories = [TrendingRepository]() {
        didSet {
            tableView.reloadSections([0], with: .automatic)
        }
    }
    var developers = [TrendingDevelopers]() {
        didSet {
            tableView.reloadSections([1], with: .automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Trending"
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter?.fetchTrendingRepositories()
        presenter?.fetchTrendingDevelopers()
    }
    
    func showTrendingRepositories(_ repositories: [TrendingRepository]) {
        self.repositories = repositories
    }
    
    func showTrendingDevelopers(_ developers: [TrendingDevelopers]) {
        self.developers = developers
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        navigationController?.present(alert, animated: true)
    }
}

extension TrendingVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return repositories.count
        case 1:
            return developers.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "defaultRepoCell")
            let repository = repositories[indexPath.row]
            
            cell.textLabel?.text = repository.name
            cell.detailTextLabel?.text = repository.description
            
            return cell
        case 1:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "defaultDevCell")
            let developer = developers[indexPath.row]
            
            cell.textLabel?.text = developer.username
            cell.imageView?.image = UIImage(named: "img_profile_placeholder")
            if let avatarUrl = developer.avatar {
                cell.imageView?.loadImage(url: avatarUrl)
            }
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "REPOSITORIES"
        case 1:
            return "DEVELOPERS"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
