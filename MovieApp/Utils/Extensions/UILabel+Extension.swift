//
//  UILabel+Extension.swift
//  MovieApp
//
//  Created by Vladislav Sitsko on 06.10.2022.
//

import UIKit

extension UILabel {
    func setImdbRatingColor() {
        self.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        if let rating = Double(self.text!) {
            switch  rating {
            case _ where rating == 0:
                self.text = "-"
                self.textColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
            case _ where rating < 1:
                self.textColor = UIColor(red: 255/255, green: 0/255, blue: 15/255, alpha: 1)
            case _ where rating < 2:
                self.textColor = UIColor(red: 255/255, green: 46/255, blue: 0/255, alpha: 1)
            case _ where rating < 3:
                self.textColor = UIColor(red: 255/255, green: 92/255, blue: 0/255, alpha: 1)
            case _ where rating < 4:
                self.textColor = UIColor(red: 255/255, green: 182/255, blue: 73/255, alpha: 1)
            case _ where rating < 5:
                self.textColor = UIColor(red: 255/255, green: 218/255, blue: 86/255, alpha: 1)
            case _ where rating < 6:
                self.textColor = UIColor(red: 250/255, green: 255/255, blue: 0/255, alpha: 1)
            case _ where rating < 7:
                self.textColor = UIColor(red: 204/255, green: 255/255, blue: 0/255, alpha: 1)
            case _ where rating < 8:
                self.textColor = UIColor(red: 158/255, green: 255/255, blue: 0/255, alpha: 1)
            case _ where rating < 9:
                self.textColor = UIColor(red: 112/255, green: 255/255, blue: 0/255, alpha: 1)
            case _ where rating < 10:
                self.textColor = UIColor(red: 0/255, green: 255/255, blue: 117/255, alpha: 1)
            default:
                self.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            }
        } else {
            self.text = "-"
        }
    }
}
