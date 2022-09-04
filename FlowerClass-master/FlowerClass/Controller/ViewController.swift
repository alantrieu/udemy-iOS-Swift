
import UIKit
import Vision
import SDWebImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    let imagePicker = UIImagePickerController()
    var getWikiData = GetWikiData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        
        getWikiData.delegate = self
        textView.text = ""
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let takenPicture = info[.editedImage] as? UIImage {
            guard let ciImage = CIImage(image: takenPicture) else {
                fatalError("Could not convert takenPicture to CIImage")
            }
            detect(ciImage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func detect (_ ciImage: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            fatalError("Loading CoreML failed.")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process image.")
            }
            
            if let firstResult = results.first?.identifier {
                self.navigationItem.title = firstResult.capitalized
                self.getWikiData.performRequest(with: firstResult)
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: ciImage)
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
        
        present(imagePicker, animated: true, completion: nil)
    }
}

extension ViewController: WikiData {
    
    func passWikiData(wikiExtract: String, wikiFlowerImage: String) {
        
        DispatchQueue.main.async {
            self.imageView.sd_setImage(with: URL(string: wikiFlowerImage))
            self.textView.text = wikiExtract
        }
    }
}
