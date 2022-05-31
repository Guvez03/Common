//
//  Date+Extension.swift
//  MovieDBProject
//
//  Created by Ahmet Güvez on 15.05.2022.
//

import Foundation

extension Date {
    func convertDateFormater(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return  dateFormatter.string(from: date!)
    }
}
