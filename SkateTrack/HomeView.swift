import SwiftUI

struct HomeView: View {
    @Binding var currentView: String
    
    
    @State private var totalDistance: Int = 0
    @State private var averageSpeed: Double = 0.0
    @State private var totalDuration: Int = 0
    
    @State private var showDatePicker: Bool = false
    @State private var selectedDate: Date? = nil
    
    @State private var top_padding: CGFloat = 0
    @State private var top_frame: CGFloat = 320
    @State private var top_frame_top: CGFloat = 0
    @State private var bott_frame: CGFloat = 320
    @State private var logo_height: CGFloat = 150
    
    var body: some View {
        ZStack {
            
            LinearGradient(
                gradient: Gradient(colors: [Color(hexCode: "1d1d1d"), Color(hexCode: "1d1d1d")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            
            Image("HomeBg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                         LinearGradient(
                             gradient: Gradient(colors: [
                                 Color(hexCode: "F16B00").opacity(0.8),  
                                 Color(hexCode: "4A4A4A").opacity(0.8),  
                                 Color(hexCode: "000000").opacity(0.8)   
                             ]),
                             startPoint: .topTrailing,
                             endPoint: .bottomLeading
                         )
                     )
                    .frame(height: top_frame)
                    .padding(.horizontal, 20)
                    .padding(.top, safeAreaTopPadding() + top_padding)
                    .overlay(
                        VStack(alignment: .center, spacing: 10) {
                            Text("SKATING WORKOUTS")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(Color(hexCode: "640F1C"))  
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                                .padding(3)
                                .fixedSize(horizontal: false, vertical: true)
                                .overlay(
                                    Text("SKATING WORKOUTS")
                                        .font(.system(size: 30, weight: .bold))
                                        .foregroundColor(Color(hexCode: "FF732A"))  
                                        .offset(x: 0.5, y: 0.5)  
                                )
                            
                            Text("YOUR OVERALL RESULTS TODAY")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                            
                            Spacer().frame(height: 10)
                            
                            VStack(alignment: .center, spacing: 10) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.clear)  
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
                                        .frame(height: 40)
                                        .shadow(
                                            color: Color.black.opacity(0.2),
                                            radius: 3, x: 2, y: 2
                                        )

                                    HStack {
                                        Text("TOTAL DISTANCE:")
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(.white)
                                            .padding(.leading, 10)

                                        Spacer()

                                        Text("\(totalDistance) km")
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(.white)
                                            .padding(.trailing, 10)
                                    }
                                }
                                .frame(width: 280)
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.clear)  
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
                                        .frame(height: 40)
                                        .shadow(
                                            color: Color.black.opacity(0.2),
                                            radius: 3, x: 2, y: 2
                                        )

                                    HStack {
                                        Text("AVERAGE SPEED:")
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(.white)
                                            .padding(.leading, 10)

                                        Spacer()

                                        Text("\(String(format: "%.2f", averageSpeed)) km/h")
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(.white)
                                            .padding(.trailing, 10)
                                    }
                                }
                                .frame(width: 280)
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.clear)  
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
                                        .frame(height: 40)
                                        .shadow(
                                            color: Color.black.opacity(0.2), radius: 3, x: 2, y: 2
                                        )

                                    HStack {
                                        Text("TOTAL TIME:")
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(.white)
                                            .padding(.leading, 10)

                                        Spacer()

                                        Text("\(totalDuration) min")
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(.white)
                                            .padding(.trailing, 10)
                                    }
                                }
                                .frame(width: 280)
                            }
                        }
                            .padding(.top,top_frame_top)
                            .padding()
                            .padding(.top, safeAreaTopPadding() / 2)
                    )
                
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                         LinearGradient(
                             gradient: Gradient(colors: [
                                Color(hexCode: "F16B00").opacity(0.8),  
                                Color(hexCode: "4A4A4A").opacity(0.8),  
                                Color(hexCode: "000000").opacity(0.8)   
                             ]),
                             startPoint: .topTrailing,
                             endPoint: .bottomLeading
                         )
                     )
                    .frame(height: bott_frame)
                    .padding(.horizontal, 20)
                    .overlay(
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Spacer()
                                Button(action: {
                                    showDatePicker = true
                                }) {
                                    ZStack(alignment: .bottom) {
                                        Text(selectedDate == nil ? "SELECT A DATE" : formatDate(selectedDate!).uppercased())
                                            .font(.system(size: 20, weight: .semibold))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, minHeight: 35)
                                            .padding(6)

                                        
                                        Rectangle()
                                            .fill(Color(hexCode: "F16B00"))
                                            .frame(height: 2)  
                                            .padding(.horizontal, 10)  
                                    }
                                    .cornerRadius(10)
                                    .shadow(
                                        color: Color.black.opacity(0.2),
                                        radius: 3, x: 2, y: 2
                                    )
                                }
                                .frame(width: 200, height: 50)
                                Spacer()
                            }
                            
                            if selectedDate == nil {
                                
                                VStack(alignment: .center, spacing: 20) {
                                    Spacer()
                                    Image("skate_logo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: logo_height)
                                    
                                    Text("PLEASE SELECT A DATE")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                            } else {
                                
                                let filteredWorkouts = fetchWorkouts(for: selectedDate!)
                                if filteredWorkouts.isEmpty {
                                    VStack(alignment: .center, spacing: 20) {
                                        Spacer()
                                        Image("skate_logo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: logo_height)
                                        
                                        Text("YOU DON'T HAVE ANY\nWORKOUTS ADDED YET")
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity)
                                } else {
                                    ScrollView {
                                        VStack(spacing: 10) {
                                            ForEach(Array(filteredWorkouts.enumerated()), id: \.offset) { index, workout in
                                                VStack(alignment: .leading, spacing: 5) {
                                                    Text("WORKOUT \(index + 1)")
                                                        .font(.system(size: 16, weight: .semibold))
                                                        .shadow(color: Color.black.opacity(0.5), radius: 2, x: 1, y: 1)
                                                        .foregroundColor(Color(hexCode: "FF732A"))  
                                                    
                                                    Text("Distance:      \(workout.distance) km")
                                                        .font(.system(size: 14, weight: .semibold))
                                                        .foregroundColor(.white)
                                                    
                                                    Text("Speed:           \(workout.speed) km/h")
                                                        .font(.system(size: 14, weight: .semibold))
                                                        .foregroundColor(.white)
                                                    
                                                    Text("Duration:      \(workout.duration) min")
                                                        .font(.system(size: 14, weight: .semibold))
                                                        .foregroundColor(.white)
                                                }
                                                .padding()
                                                .frame(maxWidth: 320)
                                                .background(
                                                    ZStack {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .fill(Color(hexCode: "1d1d1d").opacity(0.4))
                                                            .blur(radius: 10)  

                                                        RoundedRectangle(cornerRadius: 10)
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
                                                .shadow(
                                                    color: Color.black.opacity(0.2),
                                                    radius: 3, x: 2, y: 2
                                                )
                                                .frame(maxWidth: .infinity, alignment: .center)
                                                .padding(.horizontal, 20)
                                            }
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding(.top, 10)
                                    }
                                }
                            }
                            
                        }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                    )
            
                Spacer()
                
            }
        }
        .onAppear {
            fetchDailyStats()
            checkScreenAspectRatio()
        }
        
        if showDatePicker {
            ZStack {
                
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                
                VStack {
                    Text("SELECT A DATE")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .shadow(color: Color.black.opacity(0.5), radius: 2, x: 1, y: 1)
                        .padding()
                    
                    
                    DatePicker(
                        "",
                        selection: Binding<Date>(
                            get: { selectedDate ?? Date() },
                            set: { selectedDate = $0 }
                        ),
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
              
                    
                    
                    Button(action: {
                        if let date = selectedDate {
                    
                            showDatePicker = false
                        } else {
                            
                            selectedDate = Date()
                            showDatePicker = false
                        }
                    }) {
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
        
        
    }
    
    private func checkScreenAspectRatio() {
        let screenSize = UIScreen.main.bounds.size
        let height = screenSize.height

        // Проверяем конкретное значение высоты экрана
        if height == 667 {
            top_padding = 80
            top_frame = 280
            top_frame_top = 80
            bott_frame = 250
            logo_height = 100
        } else {
            top_frame = 320
            top_padding = 0
            top_frame_top = 0
            bott_frame = 320
            logo_height = 150
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
    private func fetchWorkouts(for date: Date) -> [Workout] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: date)
        
        
        return DatabaseManager.shared.fetchWorkouts().filter { $0.date == formattedDate }
    }
    
    
    private func fetchDailyStats() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let todayString = dateFormatter.string(from: Date())
        
        
        let allWorkouts = DatabaseManager.shared.fetchWorkouts()
     
        for workout in allWorkouts {
          
        }
        
        
        let workouts = allWorkouts.filter { $0.date == todayString }
    
        
        
        totalDistance = workouts.reduce(0) { $0 + $1.distance }
        totalDuration = workouts.reduce(0) { $0 + $1.duration }
        averageSpeed = workouts.isEmpty ? 0.0 : Double(workouts.reduce(0) { $0 + $1.speed }) / Double(workouts.count)
        
        

    }
    
    func safeAreaTopPadding() -> CGFloat {
        let keyWindow = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.windows.first { $0.isKeyWindow }
        
        return keyWindow?.safeAreaInsets.top ?? 20
    }
    
    func safeAreaBottomPadding() -> CGFloat {
        let keyWindow = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.windows.first { $0.isKeyWindow }
        
        return keyWindow?.safeAreaInsets.bottom ?? 0
    }
    
    
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            HomeView(currentView: .constant("Home"))
                .previewDevice("iPhone 12 mini")
                .previewDisplayName("iPhone 12 mini (5.4\")")
            
            
            HomeView(currentView: .constant("Home"))
                .previewDevice("iPhone 14")
                .previewDisplayName("iPhone 14 (6.1\")")
            
            
            HomeView(currentView: .constant("Home"))
                .previewDevice("iPhone 14 Pro")
                .previewDisplayName("iPhone 14 Pro (6.1\")")
            
            
            HomeView(currentView: .constant("Home"))
                .previewDevice("iPhone 14 Plus")
                .previewDisplayName("iPhone 14 Plus (6.7\")")
            
            
            HomeView(currentView: .constant("Home"))
                .previewDevice("iPhone 14 Pro Max")
                .previewDisplayName("iPhone 14 Pro Max (6.7\")")
        }
    }
}
