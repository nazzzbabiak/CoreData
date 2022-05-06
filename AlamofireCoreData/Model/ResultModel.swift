//
//  ResultModel.swift
//  JSONCoreData
//
//  Created by Nazar Babyak on 04.05.2022.
//

import SwiftUI
import CoreData

struct ResultModel: Decodable , Hashable {

    var id: Int
    var name, username, email: String?
    var phone, website: String?
    
}
