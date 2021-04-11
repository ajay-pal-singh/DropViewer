//
//  Networking.swift
//  DropViewer
//
//  Created by Ajaypal Singh on 11/4/21.
//

import Foundation
import UIKit

class NetworkServices {

    func getMoviesList(completion: @escaping (Movies) -> ()) {


        let session = URLSession(configuration: .default)
        let url = URL(string: "https://www.dropbox.com/s/q1ins5dsldsojzt/movies.json?dl=1")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        let dataTask = session.dataTask(with: urlRequest) { data, response, error in

            guard error == nil else {
                print(error?.localizedDescription as Any)
                return
            }
            guard response != nil else {
                print("no response")
                return
            }
            guard let data = data else {
                print("no data")
                return
            }
            do {
                let responseObject = try JSONDecoder().decode(Movies.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject)
                }
            } catch {
                print(error)
            }
        }
        dataTask.resume()
    }
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
