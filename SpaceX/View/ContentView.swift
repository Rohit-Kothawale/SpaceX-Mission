import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MissionHistoryViewModel()

    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.largeTitleTextAttributes = [.font : UIFont(name: StringConstants.fontGeorgiaBold, size: 50)!]
        navBarAppearance.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.2)
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }

    var body: some View {
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
                        .foregroundStyle(.black)
                }
                
            }
            .listStyle(.grouped)
            .scrollContentBackground(.hidden)
            .background(.clear)
            .shadow(radius: 2)
            .navigationTitle(Text(StringConstants.navigationTitle))
            .navigationBarTitleDisplayMode(.large)
        }
        .onAppear {
            viewModel.fetchPastLaunchesData()
        }
    }
}

#Preview {
    ContentView()
}
