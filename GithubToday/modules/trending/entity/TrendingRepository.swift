//
//  TrendingRepository.swift
//  GithubToday
//
//  Created by Indra Tirta Nugraha on 06/08/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

class TrendingRepository: Codable {
    var author: String?
    var name: String?
    var avatar: String?
    var url: String?
    var description: String?
    var language: String?
    var languageColor: String?
    var stars: Int?
    var forks: Int?
}
