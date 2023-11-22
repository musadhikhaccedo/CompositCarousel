//
//  ContainerCell.swift
//  CompositCarousel
//
//  Created by Musadhikh Muhammed on 21/11/23.
//

import UIKit

class ContainerCell: UICollectionViewCell {
    func addContent(view: UIView) {
        contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            view.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            view.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            view.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func removeAllSubviews() {
        contentView.subviews.forEach{ $0.removeFromSuperview() }
    }
}

extension UICollectionViewCell {
    static var cellIdentifier: String {
        NSStringFromClass(self)
    }
}
