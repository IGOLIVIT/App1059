//
//  HomeViewModel.swift
//  App1059
//
//  Created by IGOR on 13/11/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @Published var days: [String] = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    @Published var curDay: String = "Monday"
    
    @Published var avatars: [String] = ["ava1", "ava2", "ava3", "ava4"]
    @Published var curAv: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddSchedule: Bool = false
    @Published var isSchedule: Bool = false

    @Published var pAv: String = ""
    @Published var pFLName: String = ""
    @Published var pStatus: String = ""
    @Published var pTCPD: String = ""
    @Published var pTCPW: String = ""

    @Published var persons: [PersModel] = []
    @Published var selectedPerson: PersModel?

    func addPers() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PersModel", into: context) as! PersModel

        loan.pAv = pAv
        loan.pFLName = pFLName
        loan.pStatus = pStatus
        loan.pTCPD = pTCPD
        loan.pTCPW = pTCPW

        CoreDataStack.shared.saveContext()
    }

    func fetchPers() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PersModel>(entityName: "PersModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.persons = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.persons = []
        }
    }
    
    @Published var scDay: String = ""
    @Published var scPerson: String = ""
    @Published var scR1TM: String = ""
    @Published var scR1Dish: String = ""
    @Published var scR1RC: String = ""
    @Published var scR2TM: String = ""
    @Published var scR2Dish: String = ""
    @Published var scR2RC: String = ""

    @Published var schedules: [SchedModel] = []
    @Published var selectedSched: SchedModel?

    func addSched() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "SchedModel", into: context) as! SchedModel

        loan.scDay = scDay
        loan.scPerson = scPerson
        loan.scR1TM = scR1TM
        loan.scR1Dish = scR1Dish
        loan.scR1RC = scR1RC
        loan.scR2TM = scR2TM
        loan.scR2Dish = scR2Dish
        loan.scR2RC = scR2RC

        CoreDataStack.shared.saveContext()
    }

    func fetchScheds() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<SchedModel>(entityName: "SchedModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.schedules = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.schedules = []
        }
    }
}
