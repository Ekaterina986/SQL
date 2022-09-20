import psycopg2


def create_table(conn):
    with conn.cursor() as cur:
        cur.execute("""
                CREATE TABLE IF NOT EXISTS clients(
                    id SERIAL PRIMARY KEY,
                    name VARCHAR(20) NOT NULL,
                    surname VARCHAR(20) NOT NULL,
                    email VARCHAR(40) UNIQUE
        );
        """)
        cur.execute("""
                CREATE TABLE IF NOT EXISTS phones(
                id SERIAL PRIMARY KEY,
                phone_number BIGINT,
                client_id INTEGER NOT NULL UNIQUE  REFERENCES clients (Id)
        );
        """)
        conn.commit()


def drop_table(conn, table_name: str):
    with conn.cursor() as cur:
        cur.execute("""
            DROP TABLE %s;
            """ % table_name)
        conn.commit()


def add_clients(conn, name, surname, email):
    with conn.cursor() as cur:
        cur.execute("""
            INSERT INTO  clients(name, surname, email) VALUES(%s, %s, %s) RETURNING id;
            """, (name, surname, email))
        id = cur.fetchone()[0]
        return (id)


def add_phones(conn, phone_number, client_id):
    with conn.cursor() as cur:
        cur.execute("""
           INSERT INTO  phones(phone_number, client_id) VALUES(%s, %s);
           """, (phone_number, client_id))
        conn.commit()


def update_clients(conn, client_name, client_id):
    with conn.cursor() as cur:
        cur.execute("""
            UPDATE clients SET name=%s WHERE id=%s;
            """, (client_name, client_id))
        conn.commit()


def delete_phone(conn, phone_id):
    with conn.cursor() as cur:
        cur.execute("""
            DELETE FROM phones WHERE id=%s;
            """, (phone_id,))
        conn.commit()


def delete_client(conn, client_id):
    with conn.cursor() as cur:
        cur.execute("""
            DELETE FROM clients WHERE id=%s;
            """, (client_id,))
        conn.commit()


def get_client(conn, name: str) -> int:
    with conn.cursor() as cur:
        cur.execute("""
            SELECT id FROM clients WHERE name=%s;
            """, (name,))
        return cur.fetchone()[0]



with psycopg2.connect(database="test1", user="postgres", password="111111") as conn:

    drop_table(conn, "phones")
    drop_table(conn, "clients")
    create_table(conn)
    client_id = add_clients(conn, 'IVAN', 'IVANOV', 'ivanov@mail.ru')
    add_phones(conn, 89112223344, client_id)
    update_clients(conn, 'BOB', client_id)
    delete_phone(conn, 1)
    delete_client(conn, 1)
    client = get_client(conn, 'IVAN')
    print('client', client)

conn.close()

