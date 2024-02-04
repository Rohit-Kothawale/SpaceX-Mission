import SwiftUI

class MissionDataModelMock {
    static var modelMock: MissionsDataModel {
        MissionsDataModel(
            flightNumber: 1,
            missionName: "Mission Name",
            launchDateLocal: "Mission Date",
            rocket: nil,
            launchSite: nil,
            launchSuccess: false,
            launchFailureDetails: nil,
            links: nil,
            details: "Launch Details")
    }
}
