//
//  FFUserInfo.swift
//  FFAcssell
//
//  Created by zhou on 2019/8/1.
//  Copyright © 2019 MissZhou. All rights reserved.
//

import UIKit

class FFUserInfo: NSObject {

    ///用户token
    let accessToken: String?
    
    init(accessToken: String) {
        self.accessToken = accessToken
    }
    
}
