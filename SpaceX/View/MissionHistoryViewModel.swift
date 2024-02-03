import SwiftUI

class MissionHistoryViewModel: ObservableObject {
    @Published var missionList: [MissionsDataModel] = []
    var image: UIImage = UIImage(systemName: "suitcase")!

    func fetchPastLaunchesData() {
        NetworkManager.fetchMissionDataFromNetwork { data in
            guard let data else {
                return
            }

            DispatchQueue.main.async {
                self.missionList.append(contentsOf: data)
            }
        }
    }

    func downloadImageUsingUrl(urlString: String) {
        NetworkManager.fetchImagesFromNetworkUsing(urlString: urlString) { image in
            guard let image else {
                return
            }

            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
