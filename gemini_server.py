from flask import Flask, request, jsonify
from PIL import Image
from io import BytesIO
import google.generativeai as genai

app = Flask(__name__)

@app.route('/upload', methods=['POST'])
def upload():
  if 'file' not in request.files:
     return 'Missing Data', 400
  
  file = request.files['file']
  file_bytes = BytesIO(file.read())
  image = Image.open(file_bytes)

  APIkey = 'AIzaSyBqF5MYI_IRW1s5JN9yhV1jS4cCWpy02lI'

  genai.configure(api_key = APIkey)
  text_model = genai.GenerativeModel('gemini-1.5-pro-latest')
  vision_model = genai.GenerativeModel('gemini-pro-vision')

  img_text = vision_model.generate_content(image)

  geminiPrompt = f'this is the text describing an image outputted by gemini {img_text}, i want you to return the name of the item and its price (only the numbers) in the format of a csv like a_name,a_price,b_name,b_price and nothing else'

  response = text_model.generate_content(geminiPrompt)
  print(response.text)
  text_output = response.text
  response_from_gemini = {'output': text_output}
  return jsonify(response_from_gemini)

if __name__ == '__main__':
   app.run(host='0.0.0.0', port=5000)  # Run server on all interfaces (for development)
