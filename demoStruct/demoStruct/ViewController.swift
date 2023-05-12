//
//  ViewController.swift
//  demoStruct
//
//  Created by Nguyễn Mạnh Linh on 11/05/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tblContacts: UITableView!
    
    @IBOutlet weak var txtSearch: UITextField!
    
    var danhBa: [LienHe] = []
    var danhSachCanTim: [LienHe] = []
    var luuTruDanhba: [LienHe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let lienHe1 = LienHe(id: 1, name: "Nguyen Manh Linh", phoneNumber: "0971968611")
        danhBa.append(lienHe1)
        
        let lienHe2 = LienHe(id: 2, name: "Nguyen Khac Hung", phoneNumber: "012345678")
        danhBa.append(lienHe2)
        
        let lienHe3 = LienHe(id: 3, name: "Le Dinh Linh", phoneNumber: "024681012")
        danhBa.append(lienHe3)
        
        let lienHe4 = LienHe(id: 4, name: "Vu Dinh Duan", phoneNumber: "035791113")
        danhBa.append(lienHe4)
        
        let lienHe5 = LienHe(id: 5, name: "Giap Thi Phuong", phoneNumber: "0987654321")
        danhBa.append(lienHe5)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return danhBa.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblContacts.dequeueReusableCell(withIdentifier: "ContactCellIdentifier")!
        
        let currentContact = danhBa[indexPath.row]
        let lblContactName = cell.viewWithTag(101) as! UILabel
        lblContactName.text = currentContact.name
        let lblContactPhone = cell.viewWithTag(102) as! UILabel
        lblContactPhone.text = currentContact.phoneNumber
        
        return cell
    }
    
    
    @IBAction func btnDeleteContact(_ sender: UIButton) {
        for (index, contact) in danhBa.enumerated().reversed() {
            if contact.id % 2 == 0 {
                danhBa.remove(at: index)
            }
        }
        tblContacts.reloadData()
    }
    
    // bat su kien vuot cell thi xoa
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        danhBa.remove(at: indexPath.row)
        tblContacts.reloadData()
    }
    
    @IBAction func btnSearchContact(_ sender: UIButton) {
        
        //luuTruDanhba = danhBa
        let lienHeCanTim: String = txtSearch.text!
        
        if lienHeCanTim != ""{
            luuTruDanhba = danhBa
            for check in danhBa {
                if check.name.lowercased().contains(lienHeCanTim.lowercased()){
                    danhSachCanTim.append(check)
                    danhBa = danhSachCanTim
                    tblContacts.reloadData()
                }
            }
        }else{
            danhBa = luuTruDanhba
            danhSachCanTim = []
            tblContacts.reloadData()
        }
        print(danhSachCanTim)
        print(luuTruDanhba)
    }
    
}



struct LienHe {
    var id: Int
    var name: String
    var phoneNumber: String
}

