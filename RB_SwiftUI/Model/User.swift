import SwiftUI
import TabularData

struct User {
    let firstName: String
    let surName: String
    let issueCount: Int
    private let birthDate: Date
    
    var birthDateFormatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: birthDate)
    }
    
    init(firstName: String, surName: String, issueCount: Int, birthDate: Date) {
        self.firstName = firstName
        self.surName = surName
        self.issueCount = issueCount
        self.birthDate = birthDate
    }
    
    init(_ row: DataFrame.Row) {
        self.init(firstName: row[DataColumns.firstName.rawValue] as! String,
                  surName: row[DataColumns.surName.rawValue] as! String,
                  issueCount: row[DataColumns.issueCount.rawValue] as! Int,
                  birthDate: row[DataColumns.birthDate.rawValue] as! Date)
    }
}
