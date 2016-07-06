//
//  TableViewHeaderView.swift
//  ResumesApp
//
//  Created by macbookpro gao on 16/2/6.
//  Copyright © 2016年 GaoXiang. All rights reserved.
//

import UIKit
import Spring

class TableViewHeaderView: UIView {
    
    private var headerImg : SpringImageView?
    private var nameLabel : SpringLabel?
    private var ageLabel : SpringLabel?
    private var positionLabel : SpringLabel?
    private var lineView:SpringView?
    private var timer : NSTimer?
    var isBall = false
    
    internal init() {
        super.init(frame: .zero)
        self.createUI();
    }
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        self.createUI();
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI(){
        
        headerImg = SpringImageView.init();
        headerImg?.image = UIImage(named: "IMG_0653.jpg")
        headerImg?.contentMode = .ScaleAspectFit
        headerImg?.clipsToBounds = true
        headerImg?.layer.cornerRadius = 10
        headerImg?.layer.borderColor = UIColor.lightGrayColor().CGColor
        headerImg?.layer.borderWidth = 0.5
        headerImg?.userInteractionEnabled = true
        self.addSubview(headerImg!)
        
        nameLabel = SpringLabel.init(frame: CGRectZero);
        nameLabel?.text = "姓名:高祥"
        nameLabel?.font = UIFont.boldSystemFontOfSize(16)
        nameLabel?.textColor = UIColor.grayColor()
        self.addSubview(nameLabel!)
        
        ageLabel = SpringLabel.init(frame: CGRectZero);
        ageLabel?.text = "年龄:24岁"
        ageLabel?.font = UIFont.boldSystemFontOfSize(16)
        ageLabel?.textColor = UIColor.grayColor()
        self.addSubview(ageLabel!)
        
        positionLabel = SpringLabel.init(frame: CGRectZero);
        positionLabel?.text = "应聘职位:iOS高级开发工程师"
        positionLabel?.font = UIFont.boldSystemFontOfSize(16)
        positionLabel?.textColor = UIColor.grayColor()
        self.addSubview(positionLabel!)
        
        lineView = SpringView.init(frame: CGRectZero)
        lineView?.backgroundColor = UIColor(hex: "#FBE581")
        self.addSubview(lineView!)
        
        self.startMyAnimation()
        
        headerImg?.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: "viewTap:"))
        
        self.updateConstraintsIfNeeded()
        self.setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        headerImg?.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo(self).offset(20)
            make.top.equalTo(self).offset(30);
            make.size.equalTo(CGSizeMake(90, 90))
        })
        
        nameLabel?.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo(self.headerImg!.snp_right).offset(20)
            make.top.equalTo(self).offset(35)
        })
        
        ageLabel?.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo(self.headerImg!.snp_right).offset(20)
            make.top.equalTo(self.nameLabel!.snp_bottom).offset(10)
        })
        
        positionLabel?.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo(self.headerImg!.snp_right).offset(20)
            make.top.equalTo(self.ageLabel!.snp_bottom).offset(10)
        })
        
        lineView?.snp_makeConstraints(closure: { (make) -> Void in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self)
            make.height.equalTo(1)
        })
        super.updateConstraints()
    }
    
    func startMyAnimation(){
        lineView?.animation = "pop"
        lineView?.curve = "spring"
        lineView?.duration = 1
        lineView?.delay = 0
        lineView?.animate();
        
        nameLabel?.animation = "squeezeLeft"
        nameLabel?.curve = "spring"
        nameLabel?.duration = 1.0
        nameLabel?.delay = 0.4
        nameLabel?.animate();
        
        ageLabel?.animation = "squeezeLeft"
        ageLabel?.curve = "spring"
        ageLabel?.duration = 1.0
        ageLabel?.delay = 0.8
        ageLabel?.animate();
        
        positionLabel?.animation = "squeezeLeft"
        positionLabel?.curve = "spring"
        positionLabel?.duration = 1.0
        positionLabel?.delay = 1.2
        positionLabel?.animate();
        
        headerImg?.animation = "zoomIn"
        headerImg?.curve = "spring"
        headerImg?.duration = 1.0
        headerImg?.delay = 1.2
        headerImg?.animate();
    }
    
    func viewTap(tap:UITapGestureRecognizer){
        
        isBall = !isBall
        let animation = CABasicAnimation()
        let halfWidth = headerImg!.frame.width / 2
        let cornerRadius: CGFloat = isBall ? halfWidth : 10
        animation.keyPath = "cornerRadius"
        animation.fromValue = isBall ? 10 : halfWidth
        animation.toValue = cornerRadius
        animation.duration = 0.2
        headerImg!.layer.cornerRadius = cornerRadius
        headerImg!.layer.addAnimation(animation, forKey: "radius")
        
        headerImg?.animation = "swing"
        headerImg?.curve = "spring"
        headerImg?.duration = 1.0
        headerImg?.delay = 0.4;
        headerImg?.animate();
    }
}
