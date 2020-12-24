//
//  FFUtil.swift
//  FFAcssell
//
//  Created by D7Test on 2020/12/24.
//  Copyright © 2020 MissZhou. All rights reserved.
//

import Foundation
import SystemConfiguration

class FFConnectUtil {
    static func checkReachability(_ hostName: String) -> Bool {
        let reachability = SCNetworkReachabilityCreateWithName(nil, hostName)!
        var flags = SCNetworkReachabilityFlags.connectionAutomatic
        guard SCNetworkReachabilityGetFlags(reachability, &flags) else { return false }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
}
