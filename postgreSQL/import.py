import os
import csv

from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session,sessionmaker

engine = create_engine("postgresql://tony:admin@localhost:5432/mydb")

db = scoped_session(sessionmaker(bind=engine))


def main():
    f = open("flights.csv")
    reader = csv.reader(f)
    for origin, destination , duration in reader:
        db.execute("Insert into flights (origin, destination, duration) values (:origin, :destination, :duration)",{"origin":origin, "destination":destination, "duration":duration})
        print(f"Added flights from {origin} to {destination} lasting {duration} minutes.")
    db.commit()
if __name__ == "__main__":
    main()
