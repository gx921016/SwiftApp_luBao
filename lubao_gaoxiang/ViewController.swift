//
//  ViewController.swift
//  lubao_gaoxiang
//
//  Created by macbookpro gao on 16/2/17.
//  Copyright © 2016年 GaoXiang. All rights reserved.
//

import UIKit
import MagicalRecord
import SnapKit
import Kingfisher
import MJRefresh
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    // MARK: -
    // MARK: Vars
    private var tableView: UITableView!
    
    private var headerView: UIView!
    
    private var menu :DOPDropDownMenu!
    
    private var myFrame : CGRect = UIScreen.mainScreen().bounds
    
    private var dataArr : NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initNav()
        
        let model : LuBaoModel = LuBaoModel.init()
        if model.getData().count==0 {
           model.fillInTheData()
        }
        dataArr = model.getData();
        print(dataArr.count)
        self.view.setNeedsUpdateConstraints()
        self.view.updateConstraintsIfNeeded()
        
    }
    
    
    func initNav(){
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: "#40A2F0")
        self.title = "挑选车辆"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(),NSFontAttributeName:UIFont.systemFontOfSize(16)];
    }
    
    
    override func loadView() {
        super.loadView()
        
        
        
//        headerView = UIView(frame: CGRectMake( 0, 0, myFrame.size.width,40))
        
        //建立TableView
        tableView = UITableView(frame: view.bounds, style: .Grouped)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        //        tableView.separatorColor = UIColor(hex: "#3A659E")
        tableView.backgroundColor = UIColor(hex: "#FCFCFC")
        
        let model : LuBaoModel = LuBaoModel.init()
        tableView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: { () -> Void in
            self.tableView.mj_footer.endRefreshing()
            model.fillInTheData()
            self.dataArr = model.getData()
            self.tableView.reloadData()
        })
        
        tableView.registerClass(LuBaoTableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        view.addSubview(tableView)
        
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor(hex: "#FBE581")
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
                self?.tableView.dg_stopLoading()
                self?.tableView.reloadData()
            })
            }, loadingView: loadingView)
        tableView.dg_setPullToRefreshFillColor(UIColor(hex: "#40A2F0"))
        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
    }
    
    
    override func updateViewConstraints() {
        //设置TableView的自动布局
        tableView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view);
        }
        
        super.updateViewConstraints()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    // MARK: -
    // MARK: UITableView Data Source
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let data : Data = self.dataArr[indexPath.row] as! Data;
        if editingStyle == UITableViewCellEditingStyle.Delete {
            data.MR_deleteEntity()
            NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
            let model : LuBaoModel = LuBaoModel.init()
            dataArr = model.getData();
            self.tableView.reloadData()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cellIdentifier"
        let data : Data = self.dataArr[indexPath.row] as! Data;
        let cell  = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! LuBaoTableViewCell
        
        cell.indexLabel?.text = String(format: "%lu", indexPath.row+1)
        cell.titleImg?.kf_setImageWithURL(NSURL(string: data.carImg!)!, placeholderImage: nil, optionsInfo: [.CacheMemoryOnly])
        cell.titleLabel?.text = data.title
        let titleStr = String(format: "%@/%@/可用卷%@元",data.date!,data.carState!,data.preferentialQuota!)
        cell.infoLabel?.attributedText = self.getInfoLabelText(titleStr)
        cell.subTitleLabel?.text = data.subTitle
        cell.priceLabel?.attributedText = self.getPriceLabelText(String(format: "%@拍",data.auctionPrice!), priceStr: data.auctionPrice!)
        
        if Int(data.auctionState!)! == 1{
            cell.stateLabel?.text = "等待竞价"
            cell.stateLabel?.textColor = UIColor(colorLiteralRed: 157/255.0, green: 115/255.0, blue: 53/255.0, alpha: 1)
        }
        
        if Int(data.auctionState!)! == 2{
            cell.stateLabel?.text = "竞价中"
            cell.stateLabel?.textColor = UIColor.greenColor()
        }
        
        if Int(data.auctionState!)! == 3{
            cell.stateLabel?.text = "设置代理价"
            cell.stateLabel?.textColor = UIColor(hex: "#40A2F0")
        }
        cell.startMyAnimation()
        return cell
    }
    
    
    // MARK: -
    // MARK: UITableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        return 120
        
    }
    
    
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    func getInfoLabelText(titleStr:NSString)->NSMutableAttributedString{
    
        let aStr: NSMutableAttributedString = NSMutableAttributedString.init(string: titleStr as String)
        
        aStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor(), range: NSMakeRange(0, 15))
        aStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSMakeRange(14, 1))
        aStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor(), range: NSMakeRange(15, 1))
        
        aStr.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(13), range: NSMakeRange(0, 15))
        aStr.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(13), range: NSMakeRange(14, 1))
        aStr.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(13), range: NSMakeRange(15, 1))
        return aStr;
    }
    
    func getPriceLabelText(titleStr:NSString,priceStr:NSString)->NSMutableAttributedString{
        
        let aStr: NSMutableAttributedString = NSMutableAttributedString.init(string: titleStr as String)
        let lenth = priceStr.length
        
        aStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSMakeRange(0, lenth))
        aStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.grayColor(), range: NSMakeRange(lenth, 1))

        
        aStr.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(15), range: NSMakeRange(0, lenth))
        aStr.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(15), range: NSMakeRange(lenth, 1))

        return aStr;
    }
    
    
    //
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
 
//    // MARK: -
//    // MARK: DOPDropDownMenu Data Source
//    func numberOfColumnsInMenu(menu: DOPDropDownMenu!) -> Int {
//        return 2;
//    }
//    
//    func menu(menu: DOPDropDownMenu!, numberOfRowsInColumn column: Int) -> Int {
//        return 2;
//    }
    
    
}

