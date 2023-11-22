//
//  CarouselContainerController.swift
//  CompositCarousel
//
//  Created by Musadhikh Muhammed on 21/11/23.
//

import UIKit

typealias SectionProvider = UICollectionViewCompositionalLayoutSectionProvider
typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
typealias SnapShot = NSDiffableDataSourceSnapshot<Int, String>

public class CarouselContainerController: UIViewController {
    public weak var viewDataSource: CarouselViewSource?
    
    var sections: [any Section] = []
    var snapShots = SnapShot()
    lazy var collectionViewDataSource: DataSource = {
        return createDataSource()
    }()
    
    lazy var collectionView: UICollectionView = {
        let sectionLayoutProvider = sectionLayoutProvider()
        let collectionViewLayout = UICollectionViewCompositionalLayout(
            sectionProvider: sectionLayoutProvider
        )
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout
        )
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(
            ContainerCell.self, 
            forCellWithReuseIdentifier: ContainerCell.cellIdentifier
        )
        
        return collectionView
    }()
    
    public override func loadView() {
        view = collectionView
    }
    
    public func load(sections: [any Section]) {
        self.sections = sections
        loadCarouselSections()
    }
    
    public func load(numberOfItems: Int, at sectionIndex: Int) {
        guard sections.count > sectionIndex else { return }
        
        let existingItemIdentifiers = snapShots.itemIdentifiers(inSection: sectionIndex)
        snapShots.deleteItems(existingItemIdentifiers)
        
        let newItemIdentifiers = itemIdentifiers(
            for: sections[sectionIndex].id,
            numberOfItems: numberOfItems
        )
        snapShots.appendItems(newItemIdentifiers, toSection: sectionIndex)
        
        applyChanges()
    }
}

