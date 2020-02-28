//
//  NotificationView.swift
//  FlexLayoutSampleApp
//
//  Created by sudhakar reddy on 22/01/20.
//  Copyright © 2020 sudhakar reddy. All rights reserved.
//

import UIKit

class NotificationView: UIView {
    var rootFlexContainer: UIView  = UIView()
    var containerView: UIView = UIView()
    var imageView = UIImageView()
    var label: UILabel = UILabel()
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
        containerView.backgroundColor = UIColor.orange.withAlphaComponent(0.6)
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.orange.cgColor
        
        imageView.backgroundColor = UIColor.gray
        label.text = "Your loan tele verification is pending. it is in progress. Please wait..."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
    }
    
    func layout() {
        
        rootFlexContainer.flex.direction(.column).padding(20).define { (flex) in
            flex.addItem(containerView)
            containerView.flex.direction(.row).justifyContent(.center).define { (flex) in
                flex.addItem(imageView).width(40).height(40)
                flex.addItem(label).grow(1).paddingTop(20).paddingBottom(20).paddingRight(20)
            }
        }
        addSubview(rootFlexContainer)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainer.pin.all()
        containerView.pin.all(20)
        rootFlexContainer.flex.layout()
        containerView.flex.layout()

    }
}
