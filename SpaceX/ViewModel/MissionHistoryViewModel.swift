import SwiftUI

class MissionHistoryViewModel: ObservableObject {
    @Published var missionList: [MissionsDataModel] = []

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
}
