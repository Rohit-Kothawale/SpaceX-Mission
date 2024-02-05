import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MissionHistoryViewModel()
    @State var selectedMission: MissionsDataModel?
    @State var currentOrientation = UIDevice.current.orientation

    @Environment(\.colorScheme) var colorScheme

    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.largeTitleTextAttributes = [.font : UIFont(name: StringConstants.fontGeorgiaBold, size: 50)!]
        navBarAppearance.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.2)
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }

    struct ListModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .listStyle(.grouped)
                .shadow(radius: 2)
                .navigationTitle(Text(StringConstants.navigationTitle))
                .navigationBarTitleDisplayMode(.large)
        }
    }

    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad && currentOrientation.isLandscape {
            NavigationSplitView {
                List(viewModel.missionList, id: \.self, selection: $selectedMission) { missionData in
                    MissionCellView(missionData: missionData)
                }
                .accentColor(.clear)
                .modifier(ListModifier())
            } detail: {
                MissionDetailView(missionData: selectedMission ?? MissionDataModelMock.modelMock)
            }
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                currentOrientation = UIDevice.current.orientation
            }
            .onAppear {
                viewModel.fetchPastLaunchesData()
            }
        } else {
            NavigationStack {
                List {
                    Section {
                        ForEach(viewModel.missionList, id: \.self) { missionData in
                            NavigationLink(destination: MissionDetailView(missionData: missionData), label: {
                                MissionCellView(missionData: missionData)
                            })
                        }
                    } header: {
                        Text(StringConstants.missionListHeader)
                            .font(.headline)
                            .fontDesign(.rounded)
                            .bold()
                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(.clear)
                .modifier(ListModifier())
            }
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                currentOrientation = UIDevice.current.orientation
            }
            .onAppear {
                viewModel.fetchPastLaunchesData()
            }
        }
    }
}

#Preview {
    ContentView()
}
