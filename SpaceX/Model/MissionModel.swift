import SwiftUI

struct MissionModel: Decodable {
    let mission: [MissionsDataModel]
}

struct MissionsDataModel: Decodable {
    let missionName: String?
    let launchDateLocal: String?
    let rocket: RocketDataModel?
    let launchSite: LaunchSiteDataModel?
    let links: MissionLinksDataModel?
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
