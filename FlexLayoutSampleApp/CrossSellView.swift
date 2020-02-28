//
//  CrossSellView.swift
//  FlexLayoutSampleApp
//
//  Created by sudhakar reddy on 28/02/20.
//  Copyright © 2020 sudhakar reddy. All rights reserved.
//

import UIKit
import FlexLayout
import PinLayout

class CrossSellView: UIView {
    var rootFlexContainer: UIView  = UIView()
    
    var headerView: UIView = UIView()
    var contentView: ContentView = ContentView()
    var footerView: UIView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.backgroundColor = .green

        headerView.backgroundColor = .purple
        contentView.backgroundColor = .blue
        footerView.backgroundColor = .orange
    }

    func layout() {
        
        rootFlexContainer.flex.direction(.column).padding(20).define { (flex) in
            flex.addItem(headerView).width(100%).height(30%)
            flex.addItem(contentView).width(100%).height(40%)
            flex.addItem(footerView).width(100%).height(30%)
        }
        addSubview(rootFlexContainer)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainer.pin.all()
        rootFlexContainer.flex.layout()
    }


}

class ContentView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    var rootFlexContainer: UIView  = UIView()
    var tableView: UITableView = UITableView()
    var dataArray: [String] = ["one", "two", "three"]

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.backgroundColor = .green
        tableView.backgroundColor = .purple
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    func layout() {
        rootFlexContainer.flex.direction(.column).define { (flex) in
            flex.addItem(tableView).width(100%).height(100%)
        }
        addSubview(rootFlexContainer)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainer.pin.all()
        rootFlexContainer.flex.layout()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = self.frame.size.height
        return height/CGFloat(dataArray.count)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }

}
