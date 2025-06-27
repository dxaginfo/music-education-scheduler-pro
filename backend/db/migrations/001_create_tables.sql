CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  password_hash TEXT,
  role VARCHAR(30),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE lessons (
  id SERIAL PRIMARY KEY,
  teacher_id INTEGER REFERENCES users(id),
  student_id INTEGER REFERENCES users(id),
  datetime TIMESTAMP NOT NULL,
  duration INTEGER,
  type VARCHAR(20),
  online_url TEXT,
  notes TEXT,
  status VARCHAR(30)
);
CREATE TABLE attendance (
  id SERIAL PRIMARY KEY,
  lesson_id INTEGER REFERENCES lessons(id),
  student_id INTEGER REFERENCES users(id),
  attended BOOLEAN,
  notes TEXT
);
CREATE TABLE materials (
  id SERIAL PRIMARY KEY,
  lesson_id INTEGER REFERENCES lessons(id),
  title VARCHAR(255),
  url TEXT
);
CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  student_id INTEGER REFERENCES users(id),
  amount NUMERIC(10,2),
  paid_at TIMESTAMP,
  reference VARCHAR(255)
);
