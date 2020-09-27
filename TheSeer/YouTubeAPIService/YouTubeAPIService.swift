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
                    
                }
                
            case .failure(let err) :
                completion([], err)
            }
        }
    }
    
   
    
    // MARK: fetchYOUTUBE Videos
    func fetchVideos(url: URL, competion: @escaping DownloadCompletionHandler) {
        
        var urlRequest = URLRequest(url: url)
        urlRequest.cachePolicy = .reloadIgnoringCacheData
        urlRequest.httpMethod = "GET"
        if let etag = self.eTagForURL(urlString: url.absoluteString) {
            urlRequest.addValue(etag, forHTTPHeaderField: "IF-None-Match")
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
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
    
    // MARK: get savedEtag
    func eTagForURL(urlString : String) -> String? {
        return UserDefaults.standard.object(forKey: urlString) as! String?
    }
    
    // MARK: update eTagValue
    func updateEtag(newTag: String, url : URL) {
       
            UserDefaults.standard.setValue(newTag, forKey: url.absoluteString)
      
    }
}
