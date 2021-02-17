protocol MainPresentationLogic {
    func presentGetDataSuccess(response: Main.FetchData.Response)
    func presentGetDataFail()
}

class MainPresenter: MainPresentationLogic {
    // MARK: - Variable
    weak var viewController: MainDisplayLogic?
    
    // MARK: - Life Cycle
    deinit {
        print("MainPresenter DEINIT")
    }
    
    // MARK: - Presentation Logic
    func presentGetDataSuccess(response: Main.FetchData.Response) {
        let displayStations = response.station.map({Main.FetchData.ViewModel.DisplayStation(name: $0.name,
                                                                       time: $0.lastCommunicationTime,
                                                                       availableDock: $0.availableDocks,
                                                                       totalDock: $0.totalDocks,
                                                                       availableBike: $0.availableBikes,
                                                                       latitude: $0.latitude,
                                                                       longitude: $0.longitude)})
        let viewModel = Main.FetchData.ViewModel(displayStation: displayStations)
        viewController?.displayGetDataSuccess(viewModel: viewModel)
    }
    
    func presentGetDataFail() {
        viewController?.displayGetDataFail()
    }
}
