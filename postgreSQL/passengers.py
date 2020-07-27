import os


from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session,sessionmaker

engine = create_engine("postgresql://tony:admin@localhost:5432/mydb")

db = scoped_session(sessionmaker(bind=engine))


def main():
    flights = db.execute("SELECT origin,destination, duration from flights").fetchall()
    for flight in flights:
        print(f"{flight.origin} to {flight.destination}, {flight.duration} minutes. ")

    flight_id = int(input("\nFlight ID: "))
    flight = db.execute("select origin,destination,duration from flights where id =:id", 
    
    {"id":flight_id}).fetchone()


    if flight is None:
        print("Error no such flight")
        return

    passengers = db.execute("select name from passengers where flight_id = :flight_id",
    
     {"flight_id":flight_id}).fetchall()
    
    
    print("\nPassengers:")
    for passenger in passengers:
        print(passenger.name)
    if len(passengers) == 0:
        print("No passengers.")

if __name__ == "__main__":
    main()
