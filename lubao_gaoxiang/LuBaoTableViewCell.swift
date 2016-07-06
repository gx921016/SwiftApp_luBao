//
//  LuBaoTableViewCell.swift
//  lubao_gaoxiang
//
//  Created by macbookpro gao on 16/2/17.
//  Copyright © 2016年 GaoXiang. All rights reserved.
//

import UIKit
import Spring
class LuBaoTableViewCell: UITableViewCell {

    var titleImg : UIImageView?
    var indexLabel : UILabel?
    var aginLabel : UILabel?
    var backView : SpringView?
    
    var titleLabel :UILabel?
    var infoLabel :UILabel?
    var subTitleLabel :UILabel?
    var priceLabel: UILabel?
    var stateLabel :UILabel?
    var likeBtn:UIButton?
 
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = UIColor(colorLiteralRed: 241/255.0, green: 241/255.0, blue: 241/255.0, alpha: 1)
        self.createUI()
        contentView.setNeedsUpdateConstraints()
        contentView.updateConstraintsIfNeeded()
    }
    //创建UI
    func createUI(){
        self.backView = SpringView.init(frame: CGRectZero)
        self.backView?.backgroundColor = UIColor.whiteColor()
        self.contentView.addSubview(self.backView!)
        
        self.titleImg = UIImageView.init(frame: CGRectZero)
//        self.titleImg?.backgroundColor = UIColor.orangeColor()
        self.backView!.addSubview(self.titleImg!);
        
        self.indexLabel = UILabel.init(frame: CGRectZero)
        self.indexLabel?.backgroundColor = UIColor(hex: "#40A2F0")
        self.indexLabel?.alpha = 0.8
        self.indexLabel?.textAlignment = NSTextAlignment.Center
        self.indexLabel?.textColor = UIColor.whiteColor()
        self.indexLabel?.font = UIFont.systemFontOfSize(13)
        self.titleImg?.addSubview(self.indexLabel!)
        
        self.aginLabel = UILabel.init(frame: CGRectZero)
        self.aginLabel?.backgroundColor = UIColor(colorLiteralRed: 157/255.0, green: 115/255.0, blue: 53/255.0, alpha: 1)
        self.aginLabel?.alpha = 0.8
        self.aginLabel?.textAlignment = NSTextAlignment.Center
        self.aginLabel?.text = "再次上拍"
        self.aginLabel?.textColor = UIColor.whiteColor()
        self.aginLabel?.font = UIFont.systemFontOfSize(13)
        self.titleImg?.addSubview(self.aginLabel!)
        
        self.titleLabel = UILabel.init(frame: CGRectZero)
        self.titleLabel?.textColor = UIColor.grayColor()
        self.titleLabel?.font = UIFont.boldSystemFontOfSize(18)
        self.contentView.addSubview(self.titleLabel!)
        
        self.infoLabel = UILabel.init(frame: CGRectZero)
        self.infoLabel?.textColor = UIColor.lightGrayColor()
        self.infoLabel?.font = UIFont.systemFontOfSize(15)
        self.contentView.addSubview(self.infoLabel!)
        
        self.subTitleLabel = UILabel.init(frame: CGRectZero)
        self.subTitleLabel?.textColor = UIColor.grayColor()
        self.subTitleLabel?.font = UIFont.systemFontOfSize(15)
        self.contentView.addSubview(self.subTitleLabel!)
        
        self.priceLabel = UILabel.init(frame: CGRectZero)
        self.priceLabel?.textColor = UIColor.grayColor()
        self.priceLabel?.font = UIFont.systemFontOfSize(15)
        self.contentView.addSubview(self.priceLabel!)
        
        self.stateLabel = UILabel.init(frame: CGRectZero)
        self.stateLabel?.textColor = UIColor.grayColor()
        self.stateLabel?.font = UIFont.systemFontOfSize(15)
        self.contentView.addSubview(self.stateLabel!)
        
        self.likeBtn = UIButton.init(type: UIButtonType.Custom)
        self.likeBtn?.setTitle("加关注", forState: UIControlState.Normal)
        self.likeBtn?.layer.cornerRadius = 5.0
        self.likeBtn?.layer.borderColor = UIColor.grayColor().CGColor
        self.likeBtn?.layer.borderWidth = 0.5
        self.likeBtn?.titleLabel?.font = UIFont.systemFontOfSize(13)
        self.likeBtn?.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        self.likeBtn?.backgroundColor = UIColor(colorLiteralRed: 241/255.0, green: 241/255.0, blue: 241/255.0, alpha: 1)
        self.contentView.addSubview(self.likeBtn!)
    }
    //设置约束
    override func updateConstraints() {
        backView!.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.contentView).offset(UIEdgeInsetsMake(0, 0, -15, 0));
        }
        
        titleImg!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.backView!).offset(5)
            make.left.equalTo(self.backView!).offset(5)
            make.bottom.equalTo(self.backView!).offset(-5)
            make.width.equalTo(130)
        }
        
        indexLabel?.snp_makeConstraints(closure: { (make) -> Void in
            make.top.left.equalTo(self.titleImg!);
            make.size.equalTo(CGSizeMake(30, 25))
        })
        
        aginLabel?.snp_makeConstraints(closure: { (make) -> Void in
            make.bottom.right.equalTo(self.titleImg!);
            make.size.equalTo(CGSizeMake(60, 20))
        })
        
        titleLabel?.snp_makeConstraints(closure: { (make) -> Void in
            make.top.equalTo(self.contentView).offset(7)
            make.left.equalTo((self.titleImg?.snp_right)!).offset(5)
            make.right.equalTo(self.contentView).offset(-5)
        })
        
        infoLabel?.snp_makeConstraints(closure: { (make) -> Void in
            make.top.equalTo((self.titleLabel?.snp_bottom)!).offset(5)
            make.left.equalTo((self.titleImg?.snp_right)!).offset(5)
            make.right.equalTo(self.contentView).offset(-5)
        })
        
        subTitleLabel?.snp_makeConstraints(closure: { (make) -> Void in
            make.top.equalTo((self.infoLabel?.snp_bottom)!).offset(5)
            make.left.equalTo((self.titleImg?.snp_right)!).offset(5)
            make.right.equalTo(self.contentView).offset(-5)
        })
        
        priceLabel?.snp_makeConstraints(closure: { (make) -> Void in
            make.top.equalTo((self.subTitleLabel?.snp_bottom)!).offset(5)
            make.left.equalTo((self.titleImg?.snp_right)!).offset(5)
        })
        
        stateLabel?.snp_makeConstraints(closure: { (make) -> Void in
            make.top.equalTo((self.subTitleLabel?.snp_bottom)!).offset(5)
            make.left.equalTo((self.priceLabel?.snp_right)!).offset(5)
            make.right.equalTo(self.contentView).offset(-5)
        })

        likeBtn?.snp_makeConstraints(closure: { (make) -> Void in
            make.right.equalTo(self.backView!).offset(-8)
            make.bottom.equalTo(self.backView!).offset(-8)
            make.size.equalTo(CGSizeMake(65, 20))
        })
        super.updateConstraints()
    }
    
    
    func startMyAnimation(){
        backView?.animation = "fadeIn"
        backView?.curve = "spring"
        backView?.duration = 1.3
        backView?.delay = 0.1
        backView?.animate();
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
