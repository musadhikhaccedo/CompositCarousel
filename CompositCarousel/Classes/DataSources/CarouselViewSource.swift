//
//  CarouselViewSource.swift
//  CompositCarousel
//
//  Created by Musadhikh Muhammed on 22/11/23.
//

import Foundation

public protocol CarouselViewSource: AnyObject {
    func viewForItem(at index: Int, sectionIndex: Int) -> UIView?
}
