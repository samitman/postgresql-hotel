#python script to interface with hotel database
#allows users to interact with guests, rooms, and reservations tables
#users can view, add, or delete records from all tables

import psycopg2

conn = psycopg2.connect("postgresql://hotel_admin:change_me@localhost/hotel")
cur = conn.cursor()

#make sure to grant proper permissions on the database/tables for the user

while True:

    table_name = ''

    while table_name == '':
        print(
        "___________________________________________________________________\n",
        "Please enter the number associated with your desired table: \n",
        "1: Guests\n",
        "2: Rooms\n",
        "3: Reservations\n",
        "---Enter 0 to exit---\n",
        "___________________________________________________________________\n"
        )
        table_selection = int(input())

        if table_selection == 1:
            table_name = "guests"
        elif table_selection == 2:
            table_name = "rooms"
        elif table_selection == 3:
            table_name = "reservations"
        elif table_selection == 0:
            quit()
        else:
            print("Please enter a valid selection.")

        if table_name != '':
            print(
            "___________________________________________________________________\n",
            "Please choose an action on table "+table_name+": \n",
            "1: Show Records\n",
            "2: Create Record\n",
            "3: Delete Record\n",
            "---Enter 0 to exit---\n",
            "___________________________________________________________________\n"
        )
        action_selection = int(input())

        if action_selection == 1: #show all records
            cur.execute("""SELECT * FROM {0};""".format(table_name))
            results = cur.fetchall()
            for item in results:
                print(str(item) + "\n")
        elif action_selection == 2: #create record
            if table_name == "guests": #add guest

                print("Please enter the guest ID")
                guest_id = int(input())
                print("Please enter the first name")
                first_name = str(input())
                print("Please enter the last name")
                last_name = str(input())
                print("Please enter the email")
                email = str(input())

                cur.execute("""
                    INSERT INTO guests (guest_id, first_name, last_name, email)
                    VALUES ({0}, '{1}', '{2}', '{3}')
                    RETURNING guest_id;
                """.format(guest_id, first_name, last_name, email))
                new_guest = cur.fetchone()[0]
                print(f"New Guest Added: ID {new_guest}")
                conn.commit()

            elif table_name == "rooms": #add room
                
                print("Please enter the room ID")
                room_id = int(input())
                print("Please enter the room category (Enter S for single or D for double)")
                category_selection = str(input())
                if category_selection.upper() == "S":
                    category = "single"
                elif category_selection.upper() == "D":
                    category = "double"
                else:
                    print("Invalid category, defaulting to single")
                print("Please enter the room price")
                price = int(input())

                cur.execute("""
                    INSERT INTO rooms (room_id, category, price)
                    VALUES ({0}, '{1}', '{2}')
                    RETURNING room_id;
                """.format(room_id, category, price))
                new_room = cur.fetchone()[0]
                print(f"New Room Added: ID {room_id}")
                conn.commit()

            elif table_name == "reservations": #add reservation

                print("Please enter the reservation ID")
                reservation_id = int(input())
                print("Please enter the guest ID")
                guest_id = int(input())
                print("Please enter the room ID")
                room_id = int(input())
                print("Please enter the start date (YYYY-MM-DD)")
                start_date = str(input())
                print("Please enter the end date (YYYY-MM-DD)")
                end_date = str(input())

                cur.execute("""
                    INSERT INTO reservations (reservation_id, res_guest_id, res_room_id, res_timestamp, res_start, res_end)
                    VALUES ({0}, {1}, {2}, {3}, '{4}', '{5}')
                    RETURNING reservation_id;
                """.format(reservation_id, guest_id, room_id, "CURRENT_TIMESTAMP", start_date, end_date))
                new_room = cur.fetchone()[0]
                print(f"New Reservation Added: ID {reservation_id}")
                conn.commit()
            else:
                Print("There was an error with your request.")
        elif action_selection == 3: #delete record
            if table_name == "guests": #delete guest

                print("Please enter the guest ID")
                guest_id = int(input())

                cur.execute("""
                    DELETE FROM guests WHERE guest_id = {0}
                """.format(guest_id))
                print(f"Removed Guest: ID {guest_id}")
                conn.commit()

            elif table_name == "rooms": #delete room

                print("Please enter the room ID")
                room_id = int(input())

                cur.execute("""
                    DELETE FROM rooms WHERE room_id = {0}
                """.format(room_id))
                print(f"Removed Room: ID {room_id}")
                conn.commit()

            elif table_name == "reservations": #delete reservation

                print("Please enter the reservation ID")
                reservation_id = int(input())

                cur.execute("""
                    DELETE FROM reservations WHERE reservation_id = {0}
                """.format(reservation_id))
                print(f"Removed Reservation: ID {reservation_id}")
                conn.commit()

            else:
                Print("There was an error with your request.")
        elif action_selection == 0:
            quit()
        else:
            print("Please enter a valid selection.")

    conn.commit()

cur.close()
conn.close()