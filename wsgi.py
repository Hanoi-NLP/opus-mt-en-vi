from flask import Flask, request, render_template
from transformers import AutoTokenizer, AutoModel

app = Flask(__name__)

MODEL_NAME = "Helsinki-NLP/opus-mt-en-vi"
tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME)
model = AutoModel.from_pretrained(MODEL_NAME)

def translate(direction, text):
    MODEL_NAME = "Helsinki-NLP/opus-mt-vi-en" if direction == "vi-en" else "Helsinki-NLP/opus-mt-en-vi"
    tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME)
    model = AutoModel.from_pretrained(MODEL_NAME)

    input_ids = tokenizer.encode(text, return_tensors="pt").to("cpu").tolist()[0]
    output = model.generate(input_ids)
    translated_text = tokenizer.decode(output[0], skip_special_tokens=True)
    return translated_text

@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        direction = request.form.get("direction")
        text = request.form.get("text")
        translated_text = translate(direction, text)
        return render_template("index.html", text=translated_text)
    return render_template("index.html")

if __name__ == "__main__":
    app.run(debug=True)
