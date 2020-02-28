//
//  ViewController.swift
//  FlexLayoutSampleApp
//
//  Created by sudhakar reddy on 18/11/19.
//  Copyright © 2019 sudhakar reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var mainView: CrossSellView {
        return self.view as! CrossSellView
    }

//    override func loadView() {
//        view = NotificationView()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let crossSellView = CrossSellView(frame: self.view.frame)
        self.view.addSubview(crossSellView)
    }


}

