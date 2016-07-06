//
//  LuBaoModel.swift
//  lubao_gaoxiang
//
//  Created by macbookpro gao on 16/2/17.
//  Copyright © 2016年 GaoXiang. All rights reserved.
//

import UIKit
import MagicalRecord
class LuBaoModel: NSObject {

    override init() {
        
    }
    
    func fillInTheData(){
        
        let modelData : Data = Data.MR_createEntity()!
        modelData.title = "[北京]北京现代牌BH7203AY"
        modelData.carImg = "http://inner.lubaocar.com/Portals/0/VehiclePhoto/34511/Standard/3c226755374a4f85ad68f9743b8a4826.JPG"
        modelData.subTitle = "测试不要动"
        modelData.date = "2009年5月"
        modelData.carState = "碰撞"
        modelData.preferentialQuota = "0"
        modelData.auctionPrice = "5.0万起"
        modelData.auctionState = "3"
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
        
        let modelData2 : Data = Data.MR_createEntity()!
        modelData2.title = "[浙江]明锐牌SVW7186AJI"
        modelData2.carImg = "http://inner.lubaocar.com/Portals/0/VehiclePhoto/33506/Standard/be9bbd3f0b184a5fb71fc70193396e1e.JPG"
        modelData2.subTitle = "1"
        modelData2.date = "2010年5月"
        modelData2.carState = "碰撞"
        modelData2.preferentialQuota = "2"
        modelData2.auctionPrice = "4.0万起"
        modelData2.auctionState = "2"
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
        
        let modelData3 : Data = Data.MR_createEntity()!
        modelData3.title = "[北京]北京现代牌BH7203AY"
        modelData3.carImg = "http://inner.lubaocar.com/Portals/0/VehiclePhoto/33368/Standard/ed0e6cffa2804a2ba17c97e4875406c7.JPG"
        modelData3.subTitle = "测试不要动"
        modelData3.date = "2009年5月"
        modelData3.carState = "碰撞"
        modelData3.preferentialQuota = "0"
        modelData3.auctionPrice = "5.0万起"
        modelData3.auctionState = "1"
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
        
        
        let modelData4 : Data = Data.MR_createEntity()!
        modelData4.title = "[北京]北京现代牌BH7203AY"
        modelData4.carImg = "http://inner.lubaocar.com/Portals/0/VehiclePhoto/29497/Standard/ceab212646eb4a6099324cd8c2903fc6.jpg"
        modelData4.subTitle = "测试不要动"
        modelData4.date = "2009年5月"
        modelData4.carState = "碰撞"
        modelData4.preferentialQuota = "0"
        modelData4.auctionPrice = "10.0万起"
        modelData4.auctionState = "2"
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
        
        let modelData5 : Data = Data.MR_createEntity()!
        modelData5.title = "[北京]北京现代牌BH7203AY"
        modelData5.carImg = "http://inner.lubaocar.com/Portals/0/VehiclePhoto/29497/Standard/ceab212646eb4a6099324cd8c2903fc6.jpg"
        modelData5.subTitle = "测试不要动"
        modelData5.date = "2009年5月"
        modelData5.carState = "碰撞"
        modelData5.preferentialQuota = "0"
        modelData5.auctionPrice = "10.0万起"
        modelData5.auctionState = "2"
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
    
    }
    
    func getData()->NSArray{
        
        let arr : NSArray  = Data.MR_findAll()!
        
        return arr
    }
    
}
