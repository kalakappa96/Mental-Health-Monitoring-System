from flask import Flask,url_for, redirect, render_template , request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from pandas import DataFrame
import pickle

model = pickle.load(open("./model.pkl", 'rb'))
ct = pickle.load(open("./ct.pkl", "rb"))
le = pickle.load(open("./le.pkl", "rb"))
app = Flask(__name__) 

@app.route('/')
def hello_world():
    return render_template('index.html')
   
    


@app.get('/form')
def show_form():
     return render_template('form.html')

@app.post('/submit_form')
def submit_form():

    data = [{
        #  "Areu_Student": int(request.form["inputStudent"]),
         "Areu_Student": request.form["inputStudent"],
         "Gender": request.form["inputGender"],
         "Feeling_nervous": request.form["inputFeelingn"],
         "Control_worrying": request.form["inputControlw"],
         "Different_things": request.form["inputDifferent"],
         "Restless": request.form["inputRestless"],
         "Irritable": request.form["inputIrritable"],
         "Something_awful": request.form["inputSomethinga"],
         "Physical_problems": request.form["inputPhysicalp"],
         "Trouble_concentrating": request.form["inputTroublec"],
         "Feeling_bad": request.form["inputFeelingb"],
         "Loss_interest": request.form["inputLossi"],
         "Feeling_tiredness": request.form["inputFeelingt"],
         "Trouble_falling": request.form["inputTroublef"],
         "Feeling_guilty": request.form["inputFeelingg"],
         "Suicidal_thoughts": request.form["inputSuicidalt"],
       
     }]
    df = DataFrame.from_records(data)
    x = ct.transform(df)
    y = model.predict(x)
    Treatment = le.inverse_transform(y)[0]

    # if(Treatment=="Yes"):
    #     return f'{Treatment}, You are in deprrssion mood. Kindly, Visit to nearest Psychiatrist Doctor.'
    # if (Treatment=="No"):
    #      return f'{Treatment}, You have Anxity problem'
    # else :
    #     return  "You does not have Mental Health Problems"
    if(Treatment=="Yes"):
         message ="Depression"

    elif(Treatment=="No"):
        message ="Anxiety"

    else :
        message ="Both"
    
    return render_template('result.html', message=message)



@app.route('/teampage')
def teampage():
    return 'Welcome to Team page.'


  


if __name__=="__main__":
    app.run(debug=False, port=8000)