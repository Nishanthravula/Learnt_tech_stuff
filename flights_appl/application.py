import os

from flask import Flask, render_template, request
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

app = Flask( __name__ )

engine = create_engine("postgresql://tony:admin@localhost:5432/mydb")
db = scoped_session(sessionmaker(blind=engine))

@app.route("/")
def index():
    flights = db.execute("select * from flights").fetchall()
    return render_template("index.html",flights=flights)

@app.route("/book", methods=["POST"])
def book():
    # book aa flight

    #Get info
    name = request.form.get("name")
    try:
        flight_id = int(request.form.get("flight_id"))
    except ValueError:
        return render_template("errors.html", message="Invalid flight number.")

    #Make sure the flight exists.
    if db.execute("SELECT * from flight where id = :id", {"id : flight_id"}).rowcount == 0:
        return render_template("errors.html", message="No such flight with that ID.")
    db.execute("insert into passengers (name , flight_id) values (:name, :flight_id)",
                {"name": name, "flight_id":flight_id})
    db.commit()
    return render_template("Success.html")

