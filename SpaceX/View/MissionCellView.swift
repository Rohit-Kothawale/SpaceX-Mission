import SwiftUI

struct MissionCellView: View {
    // Constants
    static let dummyImageUrl = "https://cdn.pixabay.com/photo/2013/07/13/13/14/tiger-160601_1280.png"

    // Properties
    var missionData: MissionsDataModel

    // View
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: missionData.links?.missionPatchSmall ?? MissionCellView.dummyImageUrl)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 3)
                .padding()
            VStack(alignment: .leading) {
                Text(missionData.missionName ?? "")
                    .fontWeight(.bold)
                    .font(.subheadline)
                Text(missionData.rocket?.rocketName ?? "")
                    .font(.caption)
                Text(missionData.launchSite?.siteName ?? "")
                    .font(.caption)
                Text(missionData.launchDateLocal ?? "")
                    .font(.caption)
            }
        }
        .background(.white)
        .cornerRadius(10)
    }
}

#Preview {
    MissionCellView(missionData: MissionsDataModel(flightNumber: 1, missionName: "Mission Name", launchDateLocal: "Mission Date", rocket: nil, launchSite: nil, links: nil))
}
