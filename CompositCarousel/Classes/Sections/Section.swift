//
//  Section.swift
//  CompositCarousel
//
//  Created by Musadhikh Muhammed on 21/11/23.
//

import Foundation
import UIKit

public protocol Section: Hashable {
    var id: String { get set }
    
    func sectionLayout(environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection
}

extension Section {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: any Section, rhs: any Section) -> Bool {
        lhs.id == rhs.id
    }
}
