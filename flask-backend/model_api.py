import numpy as np  
from flask import Flask, request, jsonify  
from tensorflow.keras.models import load_model  
from PIL import Image  
import io  

app = Flask(__name__)  
model = load_model('model.h5')  

@app.route('/')  
def home():  
    return "Selamat datang di API Model!"

@app.route('/predict', methods=['POST'])  
def predict():  
    if 'file' not in request.files:  
        return jsonify({'error': 'No file part'})  
    file = request.files['file']  
    if file.filename == '':  
        return jsonify({'error': 'No selected file'})  
    
    # Membaca dan memproses gambar  
    img = Image.open(io.BytesIO(file.read()))  
    img = img.resize((224, 224))  # Mengubah ukuran  
    img_array = np.array(img) / 255.0  # Normalisasi  
    img_array = np.expand_dims(img_array, axis=0)  # Menambah dimensi batch  
    
    # Melakukan prediksi  
    predictions = model.predict(img_array)  
    predicted_class = np.argmax(predictions, axis=1)  
    
    return jsonify({'predicted_class': int(predicted_class[0])})  

if __name__ == '__main__':  
    app.run(debug=True)