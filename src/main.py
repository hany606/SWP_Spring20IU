from flask import Flask, render_template, request

app = Flask(__name__)
default_css = open("stylesheets/style.css", "r").read()

@app.route('/')
def url_index():
	buttons = {
		"Create tutorial" : "/create_tutorial",
	}
	return render_template('index.html', buttons = buttons, default_css = default_css)

@app.route('/create_tutorial', methods = ["POST", "GET"])
def url_create_tutorial():
	if request.method == "GET":
		return render_template("create_tutorial.html", default_css=default_css)


if __name__ == "__main__":
	app.run(debug = True)
