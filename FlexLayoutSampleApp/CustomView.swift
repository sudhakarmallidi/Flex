//
//  CustomView.swift
//  FlexLayoutSampleApp
//
//  Created by sudhakar reddy on 21/01/20.
//  Copyright © 2020 sudhakar reddy. All rights reserved.
//

import UIKit
import FlexLayout
import PinLayout

class CustomView: UIView {
    
    var rootFlexContainer = UIView()
    
    let boxA: UIView = UIView()
    let boxB: UIView = UIView()
    let boxC: UIView = UIView()

    
    public init() {
        super.init(frame: .zero)
        configure()
        layout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.backgroundColor = .white
        rootFlexContainer.backgroundColor = .red
        boxA.backgroundColor = .green
        boxB.backgroundColor = .blue
        boxC.backgroundColor = .purple
    }
    
    func layout() {
        rootFlexContainer.flex.direction(.column).justifyContent(.start).padding(40).define { (flex) in
            flex.addItem(boxA).height(100)
            flex.addItem(boxB).height(100).marginTop(20)
            flex.addItem(boxC).height(100).marginTop(20)
        }
        addSubview(rootFlexContainer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainer.pin.all(pin.safeArea)
        rootFlexContainer.flex.layout()
    }
    

}
