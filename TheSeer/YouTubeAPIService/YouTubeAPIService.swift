//
//  YouTubeAPIService.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import Foundation

class YouTubeAPIService {
    
    lazy var cache : URLCache = {
        URLCache(memoryCapacity: 0, diskCapacity: 10 * 1024 * 1024)
    }()
    
    typealias DownloadCompletionHandler = (Result<Data,Error>) -> Void
    
    func fetchYouTube(completion: @escaping (([Video], _ error : Error?) -> Void)) {
        guard let url = URL(string: Constants.YOUTUBE_BASE_URL) else {
            return
        }
        
        fetchVideos(url: url) { (result) in
            switch result {
            case .success(let data) :
                print("Success")
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    let videoResponded = try decoder.decode(VideoResponse.self, from: data)
                    self.updateEtag(newTag: videoResponded.etag, url: url)
                    if let items = videoResponded.items {
                        completion(items, nil)
                    }
                } catch {
                    print("Error fetching : \(error.localizedDescription)")
                }
                
            case .failure(let err) :
                completion([], err)
                print("Fetching Error : \(err.localizedDescription)")
            }
        }
        
    }
    
    
    
    // MARK: fetchYOUTUBE Videos
    func fetchVideos(url: URL, competion: @escaping DownloadCompletionHandler) {
        
        var urlRequest = URLRequest(url: url)
        urlRequest.cachePolicy = .reloadIgnoringCacheData
        urlRequest.httpMethod = "GET"
        if let etag = self.eTagForURL(urlString: url.absoluteString) {
            urlRequest.addValue(etag, forHTTPHeaderField: "If-None-Match")
        }
        
        if let cached = cache.cachedResponse(for: urlRequest) {
            print("Cahced Found!")
            print("The Cached : \(cached.data)")
            competion(.success(cached.data))
        } else {
            let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let error = error {
                    print("There is a problem with URLSession : \(error.localizedDescription)")
                    if let cachedData = self.cache.cachedResponse(for: urlRequest) {
                        competion(.success(cachedData.data))
                    }
                    return
                }
                if let response = response as? HTTPURLResponse {
                    switch response.statusCode {
                    case 200 :
                        print("Load new from URL : \(url.absoluteString)")
                        if let data = data {
                            let cachedData = CachedURLResponse(response: response, data: data)
                            self.cache.storeCachedResponse(cachedData, for: urlRequest)
                            competion(.success(data))
                        }
                    case 304 :
                        print("Not Modified")
                        print("Loock : \(String(data: data!, encoding: .utf8) ?? "abc")")
                        // Temp Implemnt
                        if let data = data {
                            let cachedData = CachedURLResponse(response: response, data: data)
                            self.cache.storeCachedResponse(cachedData, for: urlRequest)
                            competion(.success(data))
                        }
                         //
                        if let cachedData = self.cache.cachedResponse(for: urlRequest) {
                            competion(.success(cachedData.data))
                        }
                    default:
                        print("Unknnown error : \(response.statusCode)")
                    }
                }
            }
            task.resume()
        }
        
        /* func fetchVideos(url: URL, competion: ((Data) -> Void)) {
         
         var urlRequest = URLRequest(url: url)
         urlRequest.cachePolicy = .reloadIgnoringCacheData
         urlRequest.httpMethod = "GET"
         if let eTag = self.eTagForURL(urlString: url.absoluteString) {
         urlRequest.addValue(eTag, forHTTPHeaderField: "If-None-Match")
         }
         let task = URLSession.shared.dataTask(with: urlRequest) { (data, respond, error) in
         if let err = error {
         print("There is a problem with URLSession: \(err.localizedDescription)")
         if let cachedData = self.cache.cachedResponse(for: urlRequest) {
         competion(cachedData.data)
         }
         return
         }
         if let response = respond as? HTTPURLResponse {
         switch response.statusCode {
         case 200:
         print("Load new data from URL : \(url.absoluteString)")
         if let data = data {
         let cachedData = CachedURLResponse(response: response, data: data)
         self.cache.storeCachedResponse(cachedData, for: urlRequest)
         competion(data)
         }
         case 304 :
         print("Not Modifed")
         if let cachedData = self.cache.cachedResponse(for: urlRequest) {
         competion(cachedData.data)
         }
         default:
         print("Unknown error on API Response [Response Code: \(response.statusCode)]")
         }
         }
         }
         task.resume()
         }
         */
    }
    
    // MARK: get savedEtag
    func eTagForURL(urlString : String) -> String? {
        return UserDefaults.standard.object(forKey: urlString) as! String?
    }
    
    // MARK: update eTagValue
    func updateEtag(newTag: String, url : URL) {
        
        UserDefaults.standard.setValue(newTag, forKey: url.absoluteString)
        
    }
}
