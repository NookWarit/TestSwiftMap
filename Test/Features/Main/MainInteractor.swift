import Foundation
protocol MainBusinessLogic {
    func getData()
}

protocol MainDataStore {
    var stations: [Station]? { get }
}

class MainInteractor: MainBusinessLogic, MainDataStore {
    // MARK: - Variable
    var presenter: MainPresentationLogic?
    var worker = MainWorker()
    var stations: [Station]?
    
    // MARK: - Life Cycle
    deinit {
        print("MainInteractor DEINIT")
    }
    
    // MARK: - Business Logic
    func getData() {
        worker.getData(success: { response in
            self.stations = response
            let temp = Main.FetchData.Response(station: response)
            self.presenter?.presentGetDataSuccess(response: temp)
        }, fail: {
            self.presenter?.presentGetDataFail()
        })
        
    }
}
