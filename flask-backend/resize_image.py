from PIL import Image  

# Ganti dengan path gambar yang akan diuji  
input_image_path = 'path/to/your/image.jpg'  
output_image_path = 'path/to/your/resized_image.jpg'  

# Mengubah ukuran gambar  
img = Image.open(input_image_path)  
img = img.resize((224, 224))  # Mengubah ukuran gambar  
img.save(output_image_path)  

print("Gambar berhasil diubah ukurannya dan disimpan di:", output_image_path)