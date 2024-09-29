CREATE TABLE Alumnos (
    id_alumno SERIAL PRIMARY KEY,
    nombre_alumno VARCHAR(20),
	apellido_alumno VARCHAR(20),
    email_alumno VARCHAR(50),
    telefono_alumno VARCHAR(20)
);

ALTER TABLE Alumnos
ADD CONSTRAINT unique_email UNIQUE (email_alumno);

ALTER TABLE Alumnos
ALTER COLUMN email_alumno SET NOT NULL;

CREATE TABLE Bootcamps (
    id_bootcamp SERIAL PRIMARY KEY,
    nombre VARCHAR(20),
    fecha_inicio DATE,
    fecha_fin DATE 
);


CREATE TABLE Modulos (
    id_modulo SERIAL PRIMARY KEY,
    nombre_modulo VARCHAR(20),
    id_bootcamp INT,
	fecha_inicio_mod DATE,
    fecha_fin_mod DATE 
    FOREIGN KEY (id_bootcamp) REFERENCES Bootcamps(id_bootcamp)
);


CREATE TABLE Profesores (
    id_profesor SERIAL PRIMARY KEY,
    nombre_profesor VARCHAR(20),
	apellido_profesor VARCHAR(20),
    email_profesor VARCHAR(50) 
);

ALTER TABLE Profesores
ADD CONSTRAINT unique_email UNIQUE (email_profesor);

ALTER TABLE Profesores
ALTER COLUMN email_profesor SET NOT NULL;

CREATE TABLE Inscripciones (
    id_inscripcion SERIAL PRIMARY KEY
	id_alumno INT,
    id_bootcamp INT,
    fecha_inscripcion DATE NOT NULL,
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno)
	FOREIGN KEY (id_bootcamp) REFERENCES Bootcamps(id_bootcamp)
        
);


INSERT INTO Alumnos (nombre_alumno, apellido_alumno, email_alumno, telefono_alumno) VALUES
('Juan', 'Pérez', 'juan.perez@mail.com', '123456789'),
('Ana', 'Gómez', 'ana.gomez@mail.com', '987654321'),
('Carlos', 'Fernández', 'carlos.fernandez@mail.com', '555555555'),
('Laura', 'Martínez', 'laura.martinez@mail.com', '444444444'),
('David', 'Torres', 'david.torres@mail.com', '333333333');

INSERT INTO Bootcamps (nombre, fecha_inicio, fecha_fin) VALUES
('Big Data, IA & ML', '2024-04-10', '2024-10-10'),
('Desarrollo Web', '2024-06-15', '2024-011-15'),
('Cyberseguridad', '2024-03-01', '2024-06-01');


INSERT INTO Modulos (nombre_modulo, id_bootcamp, fecha_inicio_mod, fecha_fin_mod) VALUES
('HTML & CSS', 1, '2024-01-10', '2024-01-25'),
('JavaScript', 1, '2024-01-26', '2024-02-20'),
('Python', 2, '2024-02-15', '2024-03-10'),
('Machine Learning', 2, '2024-03-11', '2024-04-05'),
('Redes y Seguridad', 3, '2024-03-01', '2024-03-20'),
('Hacking Ético', 3, '2024-03-21', '2024-04-15');

INSERT INTO Profesores (nombre_profesor, apellido_profesor, email_profesor) VALUES
('Marta', 'Rodríguez', 'marta.rodriguez@mail.com'),
('Luis', 'Hernández', 'luis.hernandez@mail.com'),
('Sofía', 'Jiménez', 'sofia.jimenez@mail.com'),
('José', 'López', 'jose.lopez@mail.com');

INSERT INTO Inscripciones (id_alumno, id_bootcamp, fecha_inscripcion) VALUES
(1, 1, '2023-12-15'),
(2, 1, '2023-12-20'),
(3, 2, '2024-01-01'),
(4, 2, '2024-01-05'),
(5, 3, '2024-01-15'),
(1, 3, '2024-01-18');
