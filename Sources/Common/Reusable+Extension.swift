//
//  Reusable+Extension.swift
//  MovieDBProject
//
//  Created by Ahmet Güvez on 13.05.2022.
//
//
import UIKit

public enum UICollectionViewSupplementaryKind: String{
    case elementKindSectionFooter
    case elementKindSectionHeader
}

public protocol Reuseable: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension Reuseable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

public extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(type: T.Type) where T: Reuseable {
        self.register(UINib(nibName: T.reuseIdentifier, bundle: Bundle(for: T.self)), forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell> (forIndexPath indexPath: IndexPath) -> T where T: Reuseable {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
    }
    
    func registerSupplementaryView<T: UICollectionViewCell>(type: T.Type, kind: UICollectionViewSupplementaryKind) where T: Reuseable {
        self.register(UINib(nibName: T.reuseIdentifier, bundle: Bundle(for: T.self)), forSupplementaryViewOfKind: kind.rawValue, withReuseIdentifier: T.reuseIdentifier)
    }
}

public extension UITableView {
    func registerCell<T: UITableViewCell>(type: T.Type) where T: Reuseable {
        self.register(UINib(nibName: T.reuseIdentifier, bundle: Bundle(for: T.self)), forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell> (forIndexPath indexPath: IndexPath) -> T where T: Reuseable {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
    }
}
