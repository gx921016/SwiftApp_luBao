//
//  Data+CoreDataProperties.swift
//  lubao_gaoxiang
//
//  Created by macbookpro gao on 16/2/17.
//  Copyright © 2016年 GaoXiang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Data {

    @NSManaged var title: String?
    @NSManaged var subTitle: String?
    @NSManaged var date: String?
    @NSManaged var auctionState: String?
    @NSManaged var auctionPrice: String?
    @NSManaged var carState: String?
    @NSManaged var preferentialQuota: String?
    @NSManaged var carImg: String?

}
