import SwiftUI

struct ContentView: View {
    @State private var currentView: String = "Home"
    
    @State private var bar_height: CGFloat = 10
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.clear

        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                // Основной контент с отступом снизу, чтобы не заходил под таб-бар
                Group {
                    switch currentView {
                    case "Home":
                        HomeView(currentView: $currentView)
                    case "AddWorkout":
                        AddWorkoutView(currentView: $currentView)
                    default:
                        SettingsView(currentView: $currentView)
                    }
                }
    
            
                .frame(height: UIScreen.main.bounds.height + bar_height)
                
                // Нижний таб-бар
                CustomTabBar(currentView: $currentView)
                    .frame(height: 90)
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(hexCode: "000000").opacity(0.8),
                                Color(hexCode: "5e5e5e").opacity(0.8)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .cornerRadius(50)
                    .shadow(radius: 5)
                    .padding(.horizontal, 0)
                    // Если у устройства есть дополнительное пространство внизу (например, на iPhone с вырезом),
        
            }
            .edgesIgnoringSafeArea(.all)
            .onAppear {
          checkScreenAspectRatio()
            }
        }
        // Чтобы клавиатура не сдвигала контент
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
    private func checkScreenAspectRatio() {
        let screenSize = UIScreen.main.bounds.size
        let height = screenSize.height

        // Проверяем конкретное значение высоты экрана
        if height == 667 {
            bar_height = 22

        } else {
            bar_height = 0


        }
    }
}

struct CustomTabBar: View {
    @Binding var currentView: String

    var body: some View {
        HStack(spacing: 75) {
            Button(action: { currentView = "Home" }) {
                Image(currentView == "Home" ? "h_on" : "h_off")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.bottom, 12)
            }

            Button(action: { currentView = "AddWorkout" }) {
                Image(
                    currentView == "AddWorkout" ? "k_on" : "k_off"
                )
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .padding(.bottom, 12)
            }

            Button(action: { currentView = "Settings" }) {
                Image(
                    currentView == "Settings"
                        ? "s_on" : "s_off"
                )
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .padding(.bottom, 12)
            }
        }
        .padding(.horizontal, 30)
    }
}

extension Color {
    init(hexCode: String) {
        let scanner = Scanner(string: hexCode)
        scanner.currentIndex = hexCode.startIndex
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}



#Preview("iPhone 12 mini (5.4\")") {
    ContentView()
}

#Preview("iPhone 14 (6.1\")") {
    ContentView()
}

#Preview("iPhone 14 Pro (6.1\")") {
    ContentView()
}

#Preview("iPhone 14 Plus (6.7\")") {
    ContentView()
}

#Preview("iPhone 14 Pro Max (6.7\")") {
    ContentView()
}
