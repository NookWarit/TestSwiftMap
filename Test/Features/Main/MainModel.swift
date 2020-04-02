import Foundation

enum Main {
    enum FetchData {
        struct Request {
            
        }
        
        struct Response {
            var station: [Station]
        }
        
        struct ViewModel {
            struct DisplayStation {
                var name: String
                var time: String
                var availableDock: Int
                var totalDock: Int
                var availableBike: Int
                var latitude: String
                var longitude: String
            }
            var displayStation: [DisplayStation]
        }
    }
}
