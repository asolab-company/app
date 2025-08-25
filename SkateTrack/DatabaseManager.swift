import Foundation
import SQLite

struct DatabaseManager {
    static let shared = DatabaseManager()

    private let db: Connection
    private let workoutsTable = Table("workouts")

    private let id = SQLite.Expression<Int64>("id")
    private let date = SQLite.Expression<String>("date")
    private let distance = SQLite.Expression<Int>("distance")
    private let speed = SQLite.Expression<Int>("speed")
    private let duration = SQLite.Expression<Int>("duration")

    init() {
        do {

            let dbPath = try FileManager.default
                .url(
                    for: .documentDirectory, in: .userDomainMask,
                    appropriateFor: nil, create: true
                )
                .appendingPathComponent("workouts.sqlite3")
                .path

            db = try Connection(dbPath)

            try db.run(
                workoutsTable.create(ifNotExists: true) { table in
                    table.column(id, primaryKey: .autoincrement)
                    table.column(date)
                    table.column(distance)
                    table.column(speed)
                    table.column(duration)
                })
        } catch {
            fatalError("Не удалось подключиться к базе данных: \(error)")
        }
    }

    func saveWorkout(date: String, distance: Int, speed: Int, duration: Int) {
        do {
            let insert = workoutsTable.insert(
                self.date <- date, self.distance <- distance,
                self.speed <- speed, self.duration <- duration)
            try db.run(insert)
        } catch {
            
        }
    }

    func fetchWorkouts() -> [Workout] {
        var workouts: [Workout] = []
        do {
            for workout in try db.prepare(workoutsTable) {
                workouts.append(
                    Workout(
                        id: workout[id],
                        date: workout[date],
                        distance: workout[distance],
                        speed: workout[speed],
                        duration: workout[duration]
                    )
                )
            }
        } catch {
            
        }
        return workouts
    }
}

struct Workout {
    let id: Int64
    let date: String
    let distance: Int
    let speed: Int
    let duration: Int
}
