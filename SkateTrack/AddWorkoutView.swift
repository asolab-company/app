import SwiftUI

struct AddWorkoutView: View {

    @Binding var currentView: String

    @State private var selectedDate: Date = Date()
    @State private var selectedStartTime = Date()
    @State private var selectedEndTime = Date()
    @State private var showStartTimePicker = false
    @State private var showEndTimePicker = false

    @State private var startTime: String = ""
    @State private var endTime: String = ""
    @State private var distance: String = ""
    @State private var speed: String = ""

    @State private var showDatePicker: Bool = false
    
    @State private var frame_top: CGFloat = 50
    @State private var frame_top_text: CGFloat = 20
    @State private var spacing: CGFloat = 12
    @State private var f_height: CGFloat = 560
    
    var body: some View {
        ZStack(alignment: .topLeading) {

            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hexCode: "1f1f1f"), Color(hexCode: "1f1f1f"),
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            Image("MainBg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Spacer()

                RoundedRectangle(cornerRadius: 20)
                    .fill(
                         LinearGradient(
                             gradient: Gradient(colors: [
                                 Color(hexCode: "F16B00").opacity(0.6),  
                                 Color(hexCode: "4A4A4A").opacity(0.6),  
                                 Color(hexCode: "000000").opacity(0.6)   
                             ]),
                             startPoint: .topTrailing,
                             endPoint: .bottomLeading
                         )
                     )
                    .frame(height: f_height)
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                    }
                    .overlay(
                        VStack(alignment: .center, spacing: spacing) {

                            Text("SELECT DATE")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                                .shadow(color: Color.black.opacity(0.5), radius: 2, x: 1, y: 1)

                            Button(action: {
                                UIApplication.shared.endEditing()
                                showDatePicker = true
                            }) {
                                Text(formatDate(selectedDate).uppercased())
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, minHeight: 35)
                                    .padding(6)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Color(hexCode: "F16B00"),  
                                                        Color(hexCode: "F79734")   
                                                    ]),
                                                    startPoint: .top,
                                                    endPoint: .bottom
                                                ),
                                                lineWidth: 2
                                            )
                                    )
                                    .shadow(
                                        color: Color.black.opacity(0.2),
                                        radius: 3, x: 2, y: 2
                                    )
                            }
                            .frame(width: 200, height: 50)
                            .contentShape(Rectangle())
                            Text("ENTER WORKOUT START TIME")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                                .shadow(color: Color.black.opacity(0.5), radius: 2, x: 1, y: 1)

                            Button(action: {
                                UIApplication.shared.endEditing()
                                showStartTimePicker = true
                            }) {
                                Text(formatTime(selectedStartTime).uppercased())
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, minHeight: 35)
                                    .padding(6)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Color(hexCode: "F16B00"),  
                                                        Color(hexCode: "F79734")   
                                                    ]),
                                                    startPoint: .top,
                                                    endPoint: .bottom
                                                ),
                                                lineWidth: 2
                                            )
                                    )
                                    .shadow(
                                        color: Color.black.opacity(0.2),
                                        radius: 3, x: 2, y: 2
                                    )
                            }
                            .frame(width: 200, height: 50)
                            .contentShape(Rectangle())

                            Text("ENTER WORKOUT END TIME")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                                .shadow(color: Color.black.opacity(0.5), radius: 2, x: 1, y: 1)

                            Button(action: {
                                UIApplication.shared.endEditing()
                                showEndTimePicker = true
                            }) {
                                Text(formatTime(selectedEndTime).uppercased())
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, minHeight: 35)
                                    .padding(6)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Color(hexCode: "F16B00"),  
                                                        Color(hexCode: "F79734")   
                                                    ]),
                                                    startPoint: .top,
                                                    endPoint: .bottom
                                                ),
                                                lineWidth: 2
                                            )
                                    )
                                    .shadow(
                                        color: Color.black.opacity(0.2),
                                        radius: 3, x: 2, y: 2
                                    )
                            }
                            .frame(width: 200, height: 50)
                            .contentShape(Rectangle())

                            Text("SET THE DISTANCE")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                                .shadow(color: Color.black.opacity(0.5), radius: 2, x: 1, y: 1)

                            HStack(spacing: 0) {
                                ZStack(alignment: .leading) {
                                    
                                    if distance.isEmpty {
                                        Text("Distance")
                                            .foregroundColor(.gray)  
                                            .font(.system(size: 18, weight: .semibold))
                                            .padding(.vertical, 10)
                                            .frame(maxWidth: .infinity)
                                    }

                                    TextField("", text: $distance)
                                        .keyboardType(.numberPad)
                                        .onChange(of: distance) { newValue in
                                            distance = String(newValue.prefix(4)).filter { $0.isNumber }
                                        }
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundColor(.white)  
                                        .multilineTextAlignment(.center)
                                        .padding(.vertical, 10)
                                        .frame(maxWidth: .infinity)
                                }

                                Text("km")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 8)
                            }
                            .frame(height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color(hexCode: "F16B00"),  
                                                Color(hexCode: "F79734")   
                                            ]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        ),
                                        lineWidth: 2
                                    )
                            )
                            .frame(width: 200, height: 50)
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 2, y: 2)

                            Text("ENTER THE SPEED")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                                .shadow(color: Color.black.opacity(0.5), radius: 2, x: 1, y: 1)

                            HStack(spacing: 0) {
                                ZStack(alignment: .leading) {
                                    
                                    if speed.isEmpty {
                                        Text("Speed")
                                            .foregroundColor(.gray)  
                                            .font(.system(size: 18, weight: .semibold))
                                            .padding(.vertical, 10)
                                            .frame(maxWidth: .infinity)
                                            .multilineTextAlignment(.center)
                                    }

                                    TextField("", text: $speed)
                                        .keyboardType(.numberPad)
                                        .onChange(of: speed) { newValue in
                                            speed = String(newValue.prefix(3)).filter { $0.isNumber }
                                        }
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundColor(.white)  
                                        .multilineTextAlignment(.center)
                                        .padding(.vertical, 10)
                                        .frame(maxWidth: .infinity)
                                }

                                Text("km/h")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 8)
                            }
                            .frame(height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color(hexCode: "F16B00"),  
                                                Color(hexCode: "F79734")   
                                            ]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        ),
                                        lineWidth: 2
                                    )
                            )
                            .frame(width: 200, height: 50)
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 2, y: 2)

                            Button(action: saveWorkout) {
                                ButtonSave(
                                    text: "SAVE",
                                    gradientColors: [
                                        Color(hexCode: "F79734"),
                                        Color(hexCode: "F16B00"),
                                    ],
                                    borderGradientColors: [
                                        Color(hexCode: "8B2D1F"),
                                        Color(hexCode: "B43A28"),
                                    ]
                                )
                            }
                            .disabled(!isSaveButtonEnabled())
                            .opacity(isSaveButtonEnabled() ? 1 : 0.5)
                            .padding(.top, 20)
                        }
                        .padding()
                    )

                Spacer()
            }
            .padding()

            if showStartTimePicker {
                ZStack {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                    VStack(spacing: 20) {
                        Text("SELECT START TIME")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                            .shadow(color: Color.black.opacity(0.5), radius: 2, x: 1, y: 1)
                            .foregroundColor(.black)

                        DatePicker(
                            "", selection: $selectedStartTime,
                            displayedComponents: .hourAndMinute
                        )
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(hexCode: "1d1d1d").opacity(0.4))
                                    .blur(radius: 10)  

                                RoundedRectangle(cornerRadius: 15)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.clear,  
                                                Color(hexCode: "1d1d1d").opacity(0.6)
                                            ]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                            }
                        )
                        .colorScheme(.dark)
                        .frame(height: 200)
                        .cornerRadius(15)
                        .shadow(
                            color: Color.black.opacity(0.2), radius: 3, x: 2,
                            y: 2
                        )
         

                        Button(action: { showStartTimePicker = false }) {
                            ButtonSave(
                                text: "APPLY",
                                gradientColors: [
                                    Color(hexCode: "F79734"),
                                    Color(hexCode: "F16B00"),
                                ],
                                borderGradientColors: [
                                    Color(hexCode: "8B2D1F"),
                                    Color(hexCode: "B43A28"),
                                ]
                            )
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(hexCode: "F16B00"),  
                                        Color(hexCode: "4A4A4A"),  
                                        Color(hexCode: "F16B00")   
                                    ]),
                                    startPoint: .topTrailing,
                                    endPoint: .bottomLeading
                                )
                            )
                            .shadow(radius: 10)
                    )
                    .frame(maxWidth: 300)
                }
            }

            if showEndTimePicker {
                ZStack {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                    VStack(spacing: 20) {
                        Text("SELECT END TIME")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                            .shadow(color: Color.black.opacity(0.5), radius: 2, x: 1, y: 1)

                        DatePicker(
                            "", selection: $selectedEndTime,
                            displayedComponents: .hourAndMinute
                        )
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(hexCode: "1d1d1d").opacity(0.4))
                                    .blur(radius: 10)  

                                RoundedRectangle(cornerRadius: 15)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.clear,  
                                                Color(hexCode: "1d1d1d").opacity(0.6)
                                            ]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                            }
                        )
                        .colorScheme(.dark)
                        .frame(height: 200)
                        .cornerRadius(15)
                        .shadow(
                            color: Color.black.opacity(0.2), radius: 3, x: 2,
                            y: 2
                        )
           

                        Button(action: { showEndTimePicker = false }) {
                            ButtonSave(
                                text: "APPLY",
                                gradientColors: [
                                    Color(hexCode: "F79734"),
                                    Color(hexCode: "F16B00"),
                                ],
                                borderGradientColors: [
                                    Color(hexCode: "8B2D1F"),
                                    Color(hexCode: "B43A28"),
                                ]
                            )
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(hexCode: "F16B00"),  
                                        Color(hexCode: "4A4A4A"),  
                                        Color(hexCode: "F16B00")   
                                    ]),
                                    startPoint: .topTrailing,
                                    endPoint: .bottomLeading
                                )
                            )
                            .shadow(radius: 10)
                    )
                    .frame(maxWidth: 300)
                }
            }

            if showDatePicker {
                ZStack {

                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(hexCode: "000000").opacity(0.6),
                            Color(hexCode: "4e2b0f").opacity(0.6),
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()

                    VStack {

                        Text("SELECT A DATE")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                            .shadow(color: Color.black.opacity(0.5), radius: 2, x: 1, y: 1)
                            .padding()

                        DatePicker(
                            "", selection: $selectedDate,
                            displayedComponents: .date
                        )
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .frame(height: 200)
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(hexCode: "1d1d1d").opacity(0.4))
                                    .blur(radius: 10)  

                                RoundedRectangle(cornerRadius: 15)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.clear,  
                                                Color(hexCode: "1d1d1d").opacity(0.6)
                                            ]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                            }
                        )
                        .colorScheme(.dark)
                        .cornerRadius(15)
                        .shadow(
                            color: Color.black.opacity(0.2), radius: 3, x: 2,
                            y: 2
                        )
                  

                        Button(action: { showDatePicker = false }) {
                            ButtonSave(
                                text: "APPLY",
                                gradientColors: [
                                    Color(hexCode: "F79734"),
                                    Color(hexCode: "F16B00"),
                                ],
                                borderGradientColors: [
                                    Color(hexCode: "8B2D1F"),
                                    Color(hexCode: "B43A28"),
                                ]

                            )
                        }
                        .padding()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(hexCode: "F16B00"),  
                                        Color(hexCode: "4A4A4A"),  
                                        Color(hexCode: "F16B00")   
                                    ]),
                                    startPoint: .topTrailing,
                                    endPoint: .bottomLeading
                                )
                            )
                            .shadow(radius: 10)
                    )
                    .frame(maxWidth: 300)
                }
            }

            Button(action: {
                currentView = "Home"
            }) {
                Image("back_btn")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .padding(8)
                    .clipShape(Circle())
                    .shadow(radius: 5)
            }
            .padding(.top, frame_top)
            .padding(.leading, 20)

            ZStack {
                Text("ADD DATA")
                    .font(.system(size: 26, weight: .semibold))
                    .foregroundColor(.white)  
            }
            .padding(.top, frame_top_text)
            .position(x: UIScreen.main.bounds.width / 2, y: 70)

        }
        .onAppear {
      checkScreenAspectRatio()
        }
        
        

    }
    
    private func checkScreenAspectRatio() {
        let screenSize = UIScreen.main.bounds.size
        let height = screenSize.height

        // Проверяем конкретное значение высоты экрана
        if height == 667 {
            frame_top = 80
            frame_top_text = 80
            spacing = 7
            f_height = 510
        } else {
            frame_top = 50
            frame_top_text = 20
            spacing = 12
            f_height = 560

        }
    }
    
    private func isSaveButtonEnabled() -> Bool {

        let isEndTimeLater = selectedEndTime > selectedStartTime

        let isDistanceValid = Int(distance) != nil && !distance.isEmpty

        let isSpeedValid = Int(speed) != nil && !speed.isEmpty

        let isDateSelected = !formatDate(selectedDate).isEmpty

        return isEndTimeLater && isDistanceValid && isSpeedValid
            && isDateSelected
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }

    private func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }

    private func saveWorkout() {
        guard let distanceInt = Int(distance), let speedInt = Int(speed) else {
         
            return
        }

        let duration = calculateDuration(
            start: selectedStartTime, end: selectedEndTime)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: selectedDate)

        DatabaseManager.shared.saveWorkout(
            date: formattedDate,
            distance: distanceInt,
            speed: speedInt,
            duration: duration
        )

      
        currentView = "Home"
    }

    private func calculateDuration(start: Date, end: Date) -> Int {
        let interval = end.timeIntervalSince(start)
        let minutes = Int(ceil(interval / 60))
        return max(minutes, 1)
    }
}

struct ButtonSave: View {
    let text: String
    let gradientColors: [Color]
    let borderGradientColors: [Color]

    var body: some View {
        ZStack {

            RoundedRectangle(cornerRadius: 80)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: borderGradientColors),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 5
                )
                .frame(width: 200, height: 45)

            RoundedRectangle(cornerRadius: 80)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: gradientColors),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: 200, height: 45)

            Text(text)
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(.white)
                .shadow(
                    color: Color.black.opacity(0.4), radius: 2, x: 1, y: 1
                )
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .padding(.horizontal, 10)
        }
        .frame(width: 200, height: 45)
        .shadow(radius: 2)
    }

}

struct AddWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        Group {

            AddWorkoutView(currentView: .constant("AddWorkout"))
                .previewDevice("iPhone 12 mini")
                .previewDisplayName("iPhone 12 mini (5.4\")")

            AddWorkoutView(currentView: .constant("AddWorkout"))
                .previewDevice("iPhone 14")
                .previewDisplayName("iPhone 14 (6.1\")")

            AddWorkoutView(currentView: .constant("AddWorkout"))
                .previewDevice("iPhone 14 Pro")
                .previewDisplayName("iPhone 14 Pro (6.1\")")

            AddWorkoutView(currentView: .constant("AddWorkout"))
                .previewDevice("iPhone 14 Plus")
                .previewDisplayName("iPhone 14 Plus (6.7\")")

            AddWorkoutView(currentView: .constant("AddWorkout"))
                .previewDevice("iPhone 14 Pro Max")
                .previewDisplayName("iPhone 14 Pro Max (6.7\")")
        }
    }
}
