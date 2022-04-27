import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.isEmpty {
                    errorLabel
                } else {
                    LazyVStack(spacing: 4) {
                        ForEach(0 ..< viewModel.count, id:\.self) { rowIndex in
                            IssueCell(user: viewModel.user(atIndex: rowIndex))
                            
                        }
                    }
                    .padding(.horizontal, 8)
                    .padding(.top, 8)
                }
            }
            .navigationTitle("Issues")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var errorLabel: some View {
        VStack {
            Text("There is no data".uppercased())
                .font(.title2)
            Text("Data file may be corrupted")
                .font(.subheadline)
        }
        .multilineTextAlignment(.center)
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .foregroundColor(Color.textMain)
        .background(Color.error)
        .cornerRadius(8)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewModel())
    }
}
