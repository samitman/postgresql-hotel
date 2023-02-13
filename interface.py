import psycopg2

conn = psycopg2.connect("postgresql://hotel_admin:change_me@localhost/hotel")
cur = conn.cursor()

#make sure to grant proper permissions on the database/tables for the user

while True:

    table_name = ''

    while table_name == '':
        print("Please enter the number associated with your desired table: \n",
        "1: Guests\n",
        "2: Rooms\n",
        "3: Reservations\n"
        )

        selection = int(input())

        if selection == 1:
            table_name = "guests"
        elif selection == 2:
            table_name = "rooms"
        elif selection == 3:
            table_name = "reservations"
        else:
            print("Please enter a valid selection.")

    cur.execute("""SELECT * FROM {0};""".format(table_name))
    results = cur.fetchall()
    for item in results:
        print(str(item) + "\n")
    conn.commit()

cur.close()
conn.close()