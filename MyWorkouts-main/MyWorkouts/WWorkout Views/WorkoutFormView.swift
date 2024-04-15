

import SwiftUI
import SwiftData

struct WorkoutFormView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State var model: WorkoutFormModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                LabeledContent {
                    DatePicker("", selection: $model.date)
                } label: {
                    Text("Date/Time")
                }
                LabeledContent {
                    
                    TextField("How did it go?", text: $model.comment, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .frame(minHeight: 60)
                } label: {
                    Text("Comment")
                }
                Button(model.updating ? "Update" : "Create") {
                    if model.updating {
                        model.workout?.date = model.date
                        model.workout?.comment = model.comment
                    } else {
                        let newWorkout = Workout(date: model.date, comment: model.comment)
                        model.activity?.workouts.append(newWorkout)
                    }
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.top)
                Spacer()
            }
            .padding()
            .navigationTitle(model.updating ? "Update" : "Create")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let container = Activity.preview
    var fetchDescriptor = FetchDescriptor<Activity>()
    fetchDescriptor.sortBy = [SortDescriptor(\.name)]
    let activity = try! container.mainContext.fetch(fetchDescriptor)[0]
    return NavigationStack {WorkoutFormView(model: WorkoutFormModel(activity: activity))
    }
        .modelContainer(Activity.preview)
}

