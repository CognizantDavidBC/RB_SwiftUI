import Foundation
import TabularData

final class ViewModel: ObservableObject {
    private var csvOptions = CSVReadingOptions(hasHeaderRow: true, delimiter: ";")
    private let csvUrl = Bundle.main.url(forResource: "issues", withExtension: "csv")!
//    private let csvUrl = Bundle.main.url(forResource: "testData", withExtension: "csv")!
    
    @Published var result: DataFrame
    
    var count: Int {
        result.shape.rows
    }
    
    var isEmpty: Bool {
        count == 0
    }
    
    var maxIssues: Double {
        result.summary(ofColumns: DataColumns.issueCount.rawValue)["max"][0] ?? 0
    }
    
    private var standardDeviation: Double {
        result.summary(ofColumns: DataColumns.issueCount.rawValue)["std"][0] ?? 0
    }
    
    private var meanIssuesPerUser: Double {
        result.summary(ofColumns: DataColumns.issueCount.rawValue)["mean"][0] ?? 0
    }
    
    var lowerStDev: Double {
        meanIssuesPerUser - standardDeviation
    }
    
    var upperStDev: Double {
        meanIssuesPerUser + (2 * standardDeviation)
    }
    
    init() {
        csvOptions.addDateParseStrategy(Date.ParseStrategy(format: "\(year: .defaultDigits)-\(month: .twoDigits)-\(day: .twoDigits)T00:00:00",
                                                           timeZone: TimeZone(abbreviation: "GMT")!))
        result = (try? DataFrame(contentsOfCSVFile: csvUrl, options: csvOptions)) ?? DataFrame()
    }
    
    func user(atIndex index: Int) -> User {
        return User(result[row: index])
    }
}
