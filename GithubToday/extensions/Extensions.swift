//
//  Extensions.swift
//  GithubToday
//
//  Created by Indra Tirta Nugraha on 06/08/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

extension UIImageView {
    func loadImage(url: String) {
        AF.request(url).responseImage { response in
            if case .success(let image) = response.result {
                self.image = image
            } else {
                self.image = UIImage(named: "img_profile_placeholder")
            }
        }
    }
}
