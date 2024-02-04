import SwiftUI

struct MissionCellView: View {

    // Properties
    var missionData: MissionsDataModel

    // Date formatter
    var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = StringConstants.jsonDateFormat
        return formatter
    }()

    // Expected Date format
    var expectedFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = StringConstants.expectedDateFormat
        return formatter
    }()

    struct entryView: View {
        var label: String
        var data: String
        var body: some View {
            HStack(alignment: .top) {
                Text(label)
                    .font(.caption2)
                    .fontWeight(.bold)
                Spacer()
                Text(data)
                    .font(.caption2)
            }
        }
    }

    // View
    var body: some View {
        let date = self.formatter.date(from:missionData.launchDateLocal ?? StringConstants.dummyDateFormat)!
        HStack {
            AsyncImage(url: URL(string: missionData.links?.missionPatchSmall ?? StringConstants.dummyImageUrl)) { image in
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
                entryView(label: StringConstants.rocketLabel, data: missionData.rocket?.rocketName ?? "")
                entryView(label: StringConstants.siteNameLabel, data: missionData.launchSite?.siteName ?? "")
                entryView(label: StringConstants.dateLabel, data: "\(self.expectedFormatter.string(from: date))")
            }
        }
        .background(.white)
        .cornerRadius(10)
    }
}

#Preview {
    MissionCellView(missionData: MissionDataModelMock.modelMock)
}
