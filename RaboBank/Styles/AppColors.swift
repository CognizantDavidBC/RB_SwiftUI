import SwiftUI

struct AppColors {
    static let main = Color.white
    static let secondary = Color(red: 251/255, green: 243/255, blue: 240/255)
    static let primaryAccent = Color(red: 66/255, green: 80/255, blue: 150/255)
    static let secondaryAccent = Color(red: 210/255, green: 65/255, blue: 86/255)
}

extension Color {
    static let appBackground = AppColors.secondary
    static let textMain = AppColors.main
    static let textSecondary = AppColors.secondary
    static let cellBackground = AppColors.primaryAccent
    static let cellOverlay = AppColors.secondaryAccent
    static let error = AppColors.secondaryAccent
}


