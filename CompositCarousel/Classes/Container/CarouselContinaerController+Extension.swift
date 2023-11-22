//
//  CarouselContinaerController+Extension.swift
//  CompositCarousel
//
//  Created by Musadhikh Muhammed on 21/11/23.
//

import UIKit

// MARK: - Collection View Providers
extension CarouselContainerController {
    func sectionLayoutProvider() -> SectionProvider {
        return {[weak self] sectionNumber, environment in
            guard let self else { return nil }
            return self.sections[sectionNumber].sectionLayout(environment: environment)
        }
    }
    
    func createDataSource() -> DataSource {
        let dataSource: DataSource = .init(
            collectionView: collectionView,
            cellProvider: cellProvider()
        )
        
        return dataSource
    }
    
    func cellProvider() -> DataSource.CellProvider {
        { [weak self] collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ContainerCell.cellIdentifier,
                for: indexPath
            ) as! ContainerCell
            if let subView = self?.viewDataSource?.viewForItem(
                at: indexPath.item,
                sectionIndex: indexPath.section
            ) {
                cell.addContent(view: subView)
            } else {
                cell.removeAllSubviews()
            }
            
            return cell
        }
    }
}

extension CarouselContainerController {
    func loadCarouselSections() {
        let sectionRanges = Array(0..<sections.count)
        snapShots.appendSections(sectionRanges)
        applyChanges()
    }
    
    func applyChanges(animate: Bool = true) {
        collectionViewDataSource.apply(snapShots, animatingDifferences: animate)
    }
    
    func itemIdentifiers(for id: String, numberOfItems: Int) -> [String] {
        return (0..<numberOfItems).map { "\(id)_\($0)_identifier"}
        
    }
}
