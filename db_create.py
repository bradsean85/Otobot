import sqlite3

def add_data_to_db(tables):
	conn = sqlite3.connect('test.db')
	c = conn.cursor()

	c.execute('''
          CREATE TABLE IF NOT EXISTS countries
          ([product_id] INTEGER PRIMARY KEY, [product_name] TEXT)
          ''')
          
	c.execute('''
          CREATE TABLE IF NOT EXISTS american states
          ([product_id] INTEGER PRIMARY KEY, [price] INTEGER)
          ''')
                     
	conn.commit()