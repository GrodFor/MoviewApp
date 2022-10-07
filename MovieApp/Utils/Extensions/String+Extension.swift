//
//  String+Extension.swift
//  MovieApp
//
//  Created by Vladislav Sitsko on 06.10.2022.
//

import Foundation

extension String {
    func dateFormating() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = formatter.date(from: self) else {
            return nil
        }
        
        formatter.dateFormat = "MMM d, yyyy"
        let string = formatter.string(from: date)
        return string
    }
}
