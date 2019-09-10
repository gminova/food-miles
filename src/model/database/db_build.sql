BEGIN;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS supermarkets CASCADE;
DROP TABLE IF EXISTS origins CASCADE;
DROP TABLE IF EXISTS flags CASCADE;
DROP TABLE IF EXISTS entries CASCADE;



CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category_id INTEGER REFERENCES categories (id)
);
CREATE TABLE supermarkets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE flags (
    id SERIAL PRIMARY KEY,
    emoji_code VARCHAR(100) NOT NULL
);
CREATE TABLE origins (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    flag_id INTEGER REFERENCES flags (id)
);

CREATE TABLE entries (
    id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES products (id),
    supermarket_id INTEGER REFERENCES supermarkets (id),
    origin_id INTEGER REFERENCES origins (id),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
COMMIT;
