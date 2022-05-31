//
//  Reusable+Extension.swift
//  MovieDBProject
//
//  Created by Ahmet Güvez on 13.05.2022.
//
//
import UIKit
import Foundation

protocol Reuseable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Reuseable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(type: T.Type) where T: Reuseable {
        self.register(UINib(nibName: T.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell> (forIndexPath indexPath: IndexPath) -> T where T: Reuseable {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
    }
}

extension UITableView {
    func registerCell<T: UITableViewCell>(type: T.Type) where T: Reuseable {
        self.register(UINib(nibName: T.reuseIdentifier, bundle: nil), forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell> (forIndexPath indexPath: IndexPath) -> T where T: Reuseable {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
    }
}



