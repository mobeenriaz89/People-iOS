//
//  HomeVC.swift
//  People
//
//  Created by Mubeen Riaz on 08/09/2023.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class HomeVC: BaseVC {

    @IBOutlet weak var tfMessage: UITextField!
    
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var tlMsgs: UITableView!
    var messagesList = [Message]()
    let db = Firestore.firestore()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tlMsgs.delegate = self
        tlMsgs.dataSource = self
        tlMsgs.register(UINib(nibName: "MessageTVC", bundle: .main), forCellReuseIdentifier: "message")
        loadMessages()
        btnLogout.makeRounded(cornerRadius: 10)
    }

    @IBAction func didTapSend(_ sender: Any) {
        if let msgBody = tfMessage.text, !msgBody.isEmpty,
            let msgSender = Auth.auth().currentUser?.email{
           sendMesssage(msgBody: msgBody, msgSender: msgSender)
        }
    }
    
    @IBAction func didTapSignout(_ sender: Any) {
        FirebaseAuthModel.signout { success, msg in
            if !success{
                showAlertDialog(title: "Error", message: "Error signing out: \(String(describing: msg))")
            }else{
                AppDefaults.setLoggedIn(loggedIn: false)
                navigationController?.popViewController(animated: true)
                dismiss(animated: true, completion: nil)
                
            }
        }
    }
    
}

extension HomeVC{
    //MARK: -Firebase methods
    
    func sendMesssage(msgBody: String, msgSender: String){
        self.db.collection(Constants.FStore.collectionName)
            .addDocument(data: [
            Constants.FStore.senderField: msgSender,
            Constants.FStore.bodyField: msgBody,
            Constants.FStore.timeField: Date().timeIntervalSince1970
            ]) { (error) in
                if let e = error{
                    self.showAlertDialog(title: "Error", message: "Error sending message")
                }else{
                    DispatchQueue.main.async {self.tfMessage.text = ""}
                }
                
            }
    }
    func loadMessages(){
        self.db.collection(Constants.FStore.collectionName)
            .order(by: Constants.FStore.timeField)
            .addSnapshotListener{ (querySnapshot, error) in
                self.messagesList = []
                if let e = error{
                    self.showAlertDialog(title: "Error", message: "Error loading previous messages \(e)")
                }else{
                    if let documents = querySnapshot?.documents{
                        for doc in documents{
                            let data = doc.data()
                            if let msgSender = data[Constants.FStore.senderField] as? String,
                               let msgBody = data[Constants.FStore.bodyField] as? String{
                                let newMesssage = Message(body: msgBody, sender: msgSender)
                                self.messagesList.append(newMesssage)
                                
                                DispatchQueue.main.async {
                                    self.tlMsgs.reloadData()
                                    let indexPath = IndexPath(row: self.messagesList.count - 1, section: 0)
                                    self.tlMsgs.scrollToRow(at: indexPath, at: .top, animated: false)
                                }
                            }
                        }
                    }
                }
            }
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messagesList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "message", for: indexPath) as! MessageTVC
        cell.lblMessage.text = messagesList[indexPath.row].body
        
        if message.sender == Auth.auth().currentUser?.email{
            cell.lblMessage.textAlignment = .right
            cell.lblMessage.textColor = .white
        } else {
            cell.lblMessage.textAlignment = .left
            cell.lblMessage.textColor = .black
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messagesList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.width/8
    }
}
