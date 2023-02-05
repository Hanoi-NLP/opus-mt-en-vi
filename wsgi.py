from flask import Flask, request, render_template

app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        direction = request.form.get("direction")
        text = request.form.get("text")
        translated_text = translate(direction, text) # replace this line with your own translation logic
        return render_template("index.html", text=translated_text)
    return render_template("index.html")

def translate(direction, text):
    # Your translation logic goes here, use the "direction" parameter to determine the direction of translation
    return translated_text

if __name__ == "__main__":
    app.run(debug=True)
