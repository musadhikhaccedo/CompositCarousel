//
//  ViewController.swift
//  CompositCarousel
//
//  Created by musadhikhaccedo on 11/21/2023.
//  Copyright (c) 2023 musadhikhaccedo. All rights reserved.
//

import UIKit
import CompositCarousel

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let carouselContainer = CarouselContainerController()
        carouselContainer.viewDataSource = self
        addChildViewController(carouselContainer)
        view.addSubview(carouselContainer.view)
        carouselContainer.view.frame = view.bounds
        carouselContainer.didMove(toParentViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: CarouselViewSource {
    func viewForItem(at index: Int, sectionIndex: Int) -> UIView? {
        return nil
    }
}
