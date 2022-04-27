import SwiftUI

struct IssueCell: View {
    @EnvironmentObject var viewModel: ViewModel
    
    let user: User
    
    var body: some View {
        HStack {
            userImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.textMain)
                .frame(width: 72, height: 64, alignment: .trailing)
            VStack(alignment: .leading) {
                Text("\(user.firstName) \(user.surName)")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.textMain)
                Text(user.birthDateFormatted)
                    .font(.caption)
                    .italic()
                    .foregroundColor(.textSecondary)
                Spacer()
            }
            .padding(.leading, 4)
            Spacer()
            VStack {
                Text("\(user.issueCount > 1 ? "ISSUES" : "ISSUE")")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.textSecondary)
                Text("\(user.issueCount)")
                    .font(.largeTitle)
                    .foregroundColor(.textMain)
            }
            .padding(.trailing, 6)
        }
        .padding(.all, 8)
        .background(Color.cellBackground.inBetweenColor(Color.cellOverlay, percentage: Double(user.issueCount) / viewModel.maxIssues * 100))
        .cornerRadius(8)
        .shadow(color: .black, radius: 1)
    }
    
    var userImage: Image {
        if Double(user.issueCount) < viewModel.lowerStDev {
            return Image(systemName: "person.crop.circle.fill.badge.checkmark")
        } else if Double(user.issueCount) > viewModel.upperStDev {
            return Image(systemName: "person.crop.circle.badge.exclamationmark.fill")
        } else {
            return Image(systemName: "person.crop.circle.fill")
        }
    }
    
}

struct IssueCell_Previews: PreviewProvider {
    static var previews: some View {
        IssueCell(user: User(firstName: "Name", surName: "Last", issueCount: 7, birthDate: Date.now))
            .previewLayout(.fixed(width: 400, height: 80))
    }
}
