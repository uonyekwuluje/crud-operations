from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def index():
   return render_template("index.html")

@app.route('/create')
def create_record():
   return render_template("create.html")

@app.route('/delete')
def delete_record():
   return render_template("delete.html")

@app.route('/update')
def update_record():
   return render_template("update.html")

@app.route('/display')
def display_record():
   return render_template("display.html")

@app.route('/welcome/<user>')
def test_params(user):
   return render_template("welcome.html", name = user)




if __name__ == '__main__':
   app.run('0.0.0.0','6700',debug = True)
