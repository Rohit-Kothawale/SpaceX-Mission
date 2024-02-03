import SwiftUI

/**
 This class helps for handling Network calls like fetching data from the server.
*/
class NetworkManager {

    static func fetchMissionDataFromNetwork(_ completion: @escaping ([MissionsDataModel]?) -> Void) {
        let urlString = "https://api.spacexdata.com/v3/launches"

        guard let url = URL(string: urlString) else {
            return
        }

        let urlRequest = URLRequest(url: url)

        // Create dataTask to fetch the data from the URL.
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data else {
                return
            }

            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let parseData = try jsonDecoder.decode([MissionsDataModel].self, from: data)
                completion(parseData)
            } catch {
                completion(nil)
                print("Failed to decode data from url. Error: \(error.localizedDescription)")
            }

        }
        task.resume()
    }
}
