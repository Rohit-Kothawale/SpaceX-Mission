import SwiftUI

class MissionHistoryViewModel: ObservableObject {
    @Published var missionList: [MissionsDataModel] = []

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = ""
        return formatter
    }

    func fetchPastLaunchesData() {
        NetworkManager.fetchMissionDataFromNetwork { data in
            guard let data else {
                return
            }

            DispatchQueue.main.async {
                self.missionList = data.sorted(by: {
                    $0.launchDateLocal!.compare($1.launchDateLocal!) == .orderedDescending
                })
            }
        }
    }
}
