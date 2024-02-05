import SwiftUI

struct MissionCellView: View {
    @Environment(\.colorScheme) var colorScheme

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

    struct EntryView: View {
        @Environment(\.colorScheme) var colorScheme

        var label: String
        var data: String
        var body: some View {
            HStack(alignment: .top) {
                Text(label)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                    .font(.caption2)
                    .fontWeight(.bold)
                Spacer()
                Text(data)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                    .font(.caption2)
            }
        }
    }

    // View
    var body: some View {
        let date = self.formatter.date(from:missionData.launchDateLocal ?? StringConstants.dummyDateFormat) ?? Date()
        HStack {
            AsyncImage(url: URL(string: missionData.links?.missionPatchSmall ?? StringConstants.dummyImageUrl)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .background(colorScheme == .dark ? .black : .white)
                .cornerRadius(10)
                .shadow(radius: 3)
                .padding()
            VStack(alignment: .leading) {
                Text(missionData.missionName ?? "")
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                    .fontWeight(.bold)
                    .font(.subheadline)
                EntryView(label: StringConstants.rocketLabel, data: missionData.rocket?.rocketName ?? "")
                EntryView(label: StringConstants.siteNameLabel, data: missionData.launchSite?.siteName ?? "")
                EntryView(label: StringConstants.dateLabel, data: "\(self.expectedFormatter.string(from: date))")
            }
        }
        .background(colorScheme == .dark ? .clear : .white)
        .cornerRadius(10)
    }
}

#Preview {
    MissionCellView(missionData: MissionDataModelMock.modelMock)
}
