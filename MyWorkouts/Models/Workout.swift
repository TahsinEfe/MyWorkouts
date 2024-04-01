

import SwiftData
import Foundation

@Model
class Workout {
    var date: Date
    var activity: Activity?
    var comment: String
    
    init(date: Date, comment: String = "") {
        self.date = date
        self.comment = comment
    }
}
