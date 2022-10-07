//
//  UIStackView+Extension.swift
//  MovieApp
//
//  Created by Vladislav Sitsko on 07.10.2022.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
