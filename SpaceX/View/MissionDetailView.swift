import SwiftUI

struct MissionDetailView: View {
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

    // EntryView
    struct EntryView: View {
        var label: String
        var data: String
        var body: some View {
            HStack(alignment: .top) {
                Text(label)
                    .font(.caption)
                    .fontWeight(.bold)
                Spacer()
                Text(data)
                    .font(.caption)
            }
        }
    }

    var body: some View {
        let date = self.formatter.date(from:missionData.launchDateLocal ?? StringConstants.dummyDateFormat) ?? Date()

        VStack {
            // Mission detail List
            List {
                Image("Rocket\(missionData.flightNumber % 10)")
                    .resizable()
                    .frame(height: 250)
                Section {
                    VStack {
                        HStack {
                            AsyncImage(url: URL(string: missionData.links?.missionPatch ?? StringConstants.dummyImageUrl)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)

                            VStack {
                                EntryView(label: StringConstants.nameLabel, data: missionData.missionName ?? "")
                                EntryView(label: StringConstants.launchSuccessLabel, data: String(missionData.launchSuccess ?? true))
                                EntryView(label: StringConstants.dateLabel, data: "\(self.expectedFormatter.string(from: date))")
                            }
                        }

                        Text(missionData.details ?? "")
                            .font(.caption)
                    }
                } header: {
                    Text(StringConstants.descriptionLabel)
                        .font(.caption)
                        .fontWeight(.bold)
                }

                // Rocket Section
                Section {
                    VStack {
                        EntryView(label: StringConstants.nameLabel, data: missionData.rocket?.rocketName ?? "")
                        EntryView(label: StringConstants.idLabel, data: missionData.rocket?.rocketId ?? "")
                        EntryView(label: StringConstants.typeLabel, data: missionData.rocket?.rocketType ?? "")
                    }
                } header: {
                    Text(StringConstants.rocketSectionLabel)
                        .font(.caption)
                        .fontWeight(.bold)
                }

                // Site Details Section
                Section {
                    VStack {
                        EntryView(label: StringConstants.nameLabel, data: missionData.launchSite?.siteName ?? "")
                        EntryView(label: StringConstants.idLabel, data: missionData.launchSite?.siteId ?? "")
                        EntryView(label: StringConstants.addressLabel, data: missionData.launchSite?.siteNameLong ?? "")
                    }
                } header: {
                    Text(StringConstants.siteDetailHeader)
                        .font(.caption)
                        .fontWeight(.bold)
                }

                // Launch failure details Section
                if let launchSuccess = missionData.launchSuccess, !launchSuccess {
                    Section {
                        VStack {
                            EntryView(label: StringConstants.reasonLabel, data: missionData.launchFailureDetails?.reason ?? "")
                            EntryView(label: StringConstants.timeLabel, data: String(missionData.launchFailureDetails?.time ?? 0)+StringConstants.timeUnitSuffixString)
                        }
                    } header: {
                        Text(StringConstants.launchfailureHeader)
                            .font(.caption)
                            .fontWeight(.bold)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle(missionData.missionName ?? "")
            .navigationBarTitleDisplayMode(.inline)
        }
        Spacer()
    }
}

#Preview {
    MissionDetailView(missionData: MissionDataModelMock.modelMock)
}
