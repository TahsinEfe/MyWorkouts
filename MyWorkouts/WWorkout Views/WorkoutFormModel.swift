

import SwiftUI

@Observable
class WorkoutFormModel {
    var date: Date = Date.now
    var comment: String = ""
    var activity: Activity?
    var workout: Workout?
    var updating: Bool { workout != nil }
    
    init(activity: Activity) {
        self.activity = activity
        
    }
    
    init(workout: Workout) {
        self.workout = workout
        self.activity = workout.activity
        self.date = workout.date
        self.comment = workout.comment
    }
    
}
