//
//  VaccinationBottomPopup.swift
//  Week9Tutorial
//
//  Created by Ziyi Deng on 16/5/19.
//  Localized by Siyu Zhang
//  Copyright © 2019 Jason Haasz. All rights reserved.
//

import UIKit

class VaccinationBottomPopup: BottomPopupViewController{
    
    var selectedVac = String()
    var vaccForm = String()
    var vaccDisease = String()
    var localizedString = [[String]]()
    
    var height: CGFloat?
    var topCornerRadius: CGFloat?
    var presentDuration: Double?
    var dismissDuration: Double?
    var shouldDismissInteractively: Bool?
    
    @IBOutlet weak var disease: UILabel!
    @IBOutlet weak var vacc_detail: UILabel!
    @IBOutlet weak var vacc_name: UILabel!
    
    let vaccInfoList = [
                           ["BCG", "Bacille Calmette-Guérin (BCG) vaccine", "Tuberculosis(TB)"],
                           ["DTaP", "diphtheria, tetanus and pertussis vaccine", "brain and nervous system damage,heart and nerve damage, breathing problems"],
                           ["DTaPHibHepBIPV", "6 in 1 vaccine ", "brain and nervous system damage,heart and nerve damage,breathing problems,paralysis of muscles,blood poisoning,polio"],
                           ["HepA_Pediatric", "hepatitis A pediatric vaccine", "liver cancer,jaundice"],
                           ["HepB_Pediatric", "hepatitis B pediatric vaccine", "liver problems"],
                           ["HibMenC", "Haemophilus influenzae type b (Hib) and meningitis C", "meningitis and blood poisoning"],
                           ["IPV", "inactivated polio vaccine (IPV)", "polio"],
                           ["Measles", "Measles vaccine", "viral illness that is transmitted by respiratory aerosols"],
                           ["MMR", "Measles mumps rubella (MMR) vaccine", "3 diseases – measles, mumps and rubella in a single combined injection"],
                           ["MMRV", "Measles, mumps, rubella, varicella (chickenpox) ", "measles, mumps, rubella and chickenpox"],
                           ["MR", "Measles-rubella (MR) vaccine", "preventing both measles and rubella diseases in the child"],
                           ["OPV", "Oral polio vaccine", "polio virus"],
                           ["Rotavirus", "Rotavirus vaccine", "severe and life-threatening diarrhoea"],
                           ["Vitamin A", "Vitamin A vaccine", "vitamin A deficiency"],
                           ["DTwP", "Diptheria, tetanus and pertussis vaccines (wP)", "brain and nervous system damage,heart and nerve damage, breathing problems"],
                           ["DTwPHibHepB", "5 in 1 vaccine", "brain and nervous system damage,heart and nerve damage, breathing problems,paralysis of muscles,blood poisoning"],
                           ["Influenza_Pediatric", "Influenza_Pediatric vaccine", "flu"],
                           ["JE_LiveAtd", "Japanese encephalitis live vaccine", "Japanese encephalitis (JE) disease which mainly affects the central nervous system"],
                           ["MenA", "Meningococcal A vaccine", "severe scarring, loss of limbs, brain damage and death"],
                           ["Pneumo_conj", "Pneumococcal conjugate vaccine", "pneumonia, meningitis and bronchitis"]
                       ]
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        convertToLocalString()
        readData()
        setData()
    }
    
    func readData() {
        for info in localizedString {
            if info[0] == selectedVac {
                vaccForm = info[1]
                vaccDisease = info[2]
            }
        }
    }
    
    func setData() {
        vacc_name.text = selectedVac
        vacc_detail.text = vaccForm
        disease.text = vaccDisease
    }
    
    func convertToLocalString() {
        for i in vaccInfoList {
            var tempList = [String]()
            let a = NSLocalizedString(i[0], comment: "")
            let b = NSLocalizedString(i[1], comment: "")
            let c = NSLocalizedString(i[2], comment: "")
            tempList.append(a)
            tempList.append(b)
            tempList.append(c)
            localizedString.append(tempList)
        }
    }
}
