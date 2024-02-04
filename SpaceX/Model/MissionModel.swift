import SwiftUI

struct MissionsDataModel: Decodable, Hashable {
    let flightNumber: Int
    let missionName: String?
    let launchDateLocal: String?
    let rocket: RocketDataModel?
    let launchSite: LaunchSiteDataModel?
    let launchSuccess: Bool?
    let launchFailureDetails: LaunchDetailDataModel?
    let links: MissionLinksDataModel?
    let details: String?

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(flightNumber)
    }

    public static func == (lhs: MissionsDataModel, rhs: MissionsDataModel) -> Bool {
        return lhs.flightNumber == rhs.flightNumber
    }
}

struct RocketDataModel: Decodable {
    let rocketId: String?
    let rocketName: String?
    let rocketType: String?
}

struct LaunchSiteDataModel: Decodable {
    let siteId: String?
    let siteName: String?
    let siteNameLong: String?
}

struct MissionLinksDataModel: Decodable {
    let missionPatch: String?
    let missionPatchSmall: String?
}

struct LaunchDetailDataModel: Decodable {
    let time: Int?
    let reason: String?
}
