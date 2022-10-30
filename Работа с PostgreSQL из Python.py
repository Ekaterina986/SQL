import psycopg2


def create_table(cur):

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


def drop_table(cur, table_name: str):

    cur.execute("""
        DROP TABLE %s;
        """ % table_name)
    conn.commit()


def add_clients(cur, name, surname, email):

    cur.execute("""
        INSERT INTO  clients(name, surname, email) VALUES(%s, %s, %s) RETURNING id;
        """, (name, surname, email))
    id = cur.fetchone()[0]
    return (id)


def add_phones(cur, phone_number, client_id):

    cur.execute("""
       INSERT INTO  phones(phone_number, client_id) VALUES(%s, %s);
       """, (phone_number, client_id))
    conn.commit()


def update_clients(cur, client_id,  column_name, column_value):

    column_name_list = ['name', 'surname', 'email']
    if column_name not in column_name_list:
        print('Нет такого поля.')
        return
    cur.execute("""
        UPDATE clients SET """ + column_name + """=%s WHERE id=%s;
        """, (column_value, client_id))
    conn.commit()

def delete_phone(cur, phone_id):

    cur.execute("""
        DELETE FROM phones WHERE id=%s;
        """, (phone_id,))
    conn.commit()


def delete_client(cur, client_id):

    cur.execute("""
        DELETE FROM clients WHERE id=%s;
        """, (client_id,))
    conn.commit()


def get_client(cur, name: str) -> int:

    cur.execute("""
        SELECT id FROM clients WHERE name=%s or surname=%s or email=%s;
        """, (name, name, name))
    return cur.fetchone()[0]

def get_client_param(cur, name: str, surname: str, email: str) -> int:

    cur.execute("""
        SELECT id FROM clients WHERE name=%s and surname=%s and email=%s;
        """, (name, surname, email))
    return cur.fetchone()[0]


if __name__ == '__main__':

    with psycopg2.connect(database="test1", user="postgres", password="111111") as conn:
        with conn.cursor() as cur:

            drop_table(cur, "phones")
            drop_table(cur, "clients")
            create_table(cur)
            client_id = add_clients(cur, 'IVAN', 'IVANOV', 'ivanov@mail.ru')
            add_phones(cur, 89112223344, client_id)
            column_name = input("Введите название поля: ")
            column_value = input("Введите значение поля: ")
            update_clients(cur, 2, column_name, column_value)
            delete_phone(cur, 1)
            delete_client(cur, 1)
            client = get_client(cur, '111')
            print('client', client)
            client_param = get_client_param(cur, 'IVAN', 'IVANOV', 'ivanov@mail.ru')
            print('client', client_param)

    conn.close()

