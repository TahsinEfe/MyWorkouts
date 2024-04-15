

import SwiftUI
import SwiftData

struct ActivityFormView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State var model: ActivityFormModel
    @State private var selectingIcon: Bool = false
    var body: some View {
        ZStack {
            Color(UIColor.systemBackground).ignoresSafeArea()
            NavigationStack {
                VStack(spacing: 20) {
                    LabeledContent {
                        TextField("Name", text: $model.name)
                            .textFieldStyle(.roundedBorder)
                    } label: {
                        Text("Name")
                    }
                    LabeledContent {
                        Button {
                            selectingIcon.toggle()
                        } label: {
                            Image(systemName: model.icon.rawValue)
                        }
                    } label: {
                        Text("Icon")
                    }
                    
                    LabeledContent {
                        ColorPicker("", selection: $model.hexColor, supportsOpacity: false)
                    } label: {
                        Text("Activity color")
                    }
                    .padding(.top)
                    Button(model.updating ? "Update" : "Create") {
                        if model.updating {
                            model.activity?.name = model.name
                            model.activity?.icon = model.icon.rawValue
                            model.activity?.hexColor = model.hexColor.toHex()!
                            
                        } else {
                            let newActivity = Activity(name: model.name, icon: model.icon, hexColor: model.hexColor.toHex()!)
                            modelContext.insert(newActivity)
                        }
                        dismiss()
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal)
                    .buttonStyle(.borderedProminent)
                    .disabled(model.disabled)
                    .padding(.top)
                    Spacer()
                }
                .padding()
                .navigationTitle(model.updating ? "Edit Activity" : "New Activity")
                .navigationBarTitleDisplayMode(.inline)
            }
            if selectingIcon {
                ActivityIconSelectionView(selectingIcon: $selectingIcon, selectedIcon: $model.icon)
                    .zIndex(1.0)
            }
        }
    }
}

#Preview {
    ActivityFormView(model: ActivityFormModel())
        .modelContainer(Activity.preview)
}
