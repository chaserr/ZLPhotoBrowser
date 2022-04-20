//
//  SelectedButton.swift
//  Created on 2022/4/14
//  Description <#文件描述#>
//  PD <#产品文档地址#>
//  Design <#设计文档地址#>
//  Copyright © 2022 Zepp Health. All rights reserved.
//  @author tongxing(tongxing@zepp.com)   
//

import Foundation
import UIKit

class SelectedButton: UIButton {

    lazy var btnSelectImageView: UIImageView = {
        let btnSelectImageView = UIImageView()
        btnSelectImageView.image = getImage("ic_all_done_12_s5")
        btnSelectImageView.isHidden = !self.isSelected
        btnSelectImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(btnSelectImageView)
        return btnSelectImageView
    }()

    //MARK:- 重写init函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(getImage("zl_btn_circle"), for: .normal)
        setImage(UIImage(), for: .selected)
        backgroundColor = UIColor.cyan
    }

    override func select(_ sender: Any?) {
        super.select(sender)
    }

    override var isSelected: Bool {
        didSet {
            btnSelectImageView.isHidden = !isSelected
            backgroundColor = isSelected ? UIColor(hexString: "02AF8D") : .clear
        }
    }

    //swift中规定:重写控件的init(frame方法)或者init()方法.必须重写 init?(coder aDecoder: NSCoder)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.width * 0.5
        layer.masksToBounds = true
        btnSelectImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        btnSelectImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        btnSelectImageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        btnSelectImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
    }
}
