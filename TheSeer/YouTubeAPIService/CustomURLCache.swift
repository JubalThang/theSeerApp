//
//  CustomURLCache.swift
//  TheSeer
//
//  Created by RyzenMac on 9/28/20.
//

import Foundation

final class CustomURLCache : URLCache {
    let userCacheExpirKey = "CacheData"

    // How long cache data valid in seconds ( 5 days )
    let cacheExpireInterval : TimeInterval = 60 * 60 * 24 * 5
    
    // get cache reponse for a request
    override func cachedResponse(for request: URLRequest) -> CachedURLResponse? {

        // created an empty reponse
        var reponse : CachedURLResponse? = nil

        // try to get cache response
        if let cachedResponse = super.cachedResponse(for: request) {

            print("User Info : \(cachedResponse.userInfo)")
            // try to get userInfo
            if let userInfo = cachedResponse.userInfo {

                // get cache date
                if let cacheDate = userInfo[userCacheExpirKey] as! Date? {

                    // check if the cache data are expired
                    if (cacheDate.timeIntervalSinceNow < cacheExpireInterval) {
                        // remove old cache request
                        self.removeCachedResponse(for: request)
                    } else {
                        // the cache request is still valid
                        reponse = cachedResponse
                    }
                }
            }
        }
        return reponse
    }
    
    //Store cached response
    override func storeCachedResponse(_ cachedResponse: CachedURLResponse, for request: URLRequest) {
        // create userInfo dictionary
        var userInfo = [AnyHashable:Any]()
        
        if let cachedUserInfo = cachedResponse.userInfo {
            userInfo = cachedUserInfo
        }
        
        // add current date to the userInfo
        userInfo[userCacheExpirKey] = Date()
        
        // create new cached response
        let newCachedResponse = CachedURLResponse(response: cachedResponse.response, data: cachedResponse.data, userInfo: userInfo, storagePolicy: cachedResponse.storagePolicy)
        super.storeCachedResponse(newCachedResponse, for: request)
    }
}
